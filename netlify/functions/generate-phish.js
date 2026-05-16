const https = require('https');

exports.handler = async function(event, context) {
  if (event.httpMethod !== "POST") {
    return { statusCode: 405, body: "Method Not Allowed" };
  }

  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) {
    return { 
      statusCode: 500, 
      body: JSON.stringify({ error: "GEMINI_API_KEY is not set." }) 
    };
  }

  try {
    const { department, vector } = JSON.parse(event.body);

    const prompt = `
      Act as an expert cybersecurity awareness trainer. Create a highly realistic phishing email template targeting the "${department}" department, using a "${vector}" attack vector.
      
      You must respond strictly with a valid JSON object matching this exact structure (no markdown formatting, no code blocks, just raw JSON):
      {
        "category": "AI Generated",
        "name": "Short descriptive name",
        "desc": "Short description of the lure",
        "from": "Sender Name &lt;<span class='red-flag'>fake@domain.com<span class='red-flag-explainer'>Why this is fake</span></span>&gt;",
        "to": "employee@company.com",
        "subject": "The email subject",
        "date": "Today, 10:00 AM",
        "body": "The full HTML body of the email. Keep it professional, corporate, and realistic."
      }

      CRITICAL INSTRUCTIONS FOR THE HTML BODY:
      - Use inline CSS styling (e.g., <div style="...">).
      - Include at least 3 distinct "Red Flags" within the HTML body to act as the interactive phishing markers.
      - A red flag MUST be formatted exactly like this:
        <span class='red-flag'>suspicious text or link here<span class='red-flag-explainer'>Explanation of why this is a phishing indicator.</span></span>
      - Be creative with the social engineering tactics (urgency, authority, curiosity).
    `;

    const requestBody = JSON.stringify({
      contents: [{ parts: [{ text: prompt }] }],
      generationConfig: {
          temperature: 0.7,
      }
    });

    const data = await new Promise((resolve, reject) => {
      const req = https.request({
        hostname: 'generativelanguage.googleapis.com',
        path: `/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}`,
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Content-Length': Buffer.byteLength(requestBody)
        }
      }, (res) => {
        let rawData = '';
        res.on('data', (chunk) => { rawData += chunk; });
        res.on('end', () => {
          if (res.statusCode !== 200) {
            reject(new Error(`API returned status ${res.statusCode}: ${rawData}`));
          } else {
            resolve(rawData);
          }
        });
      });

      req.on('error', (e) => reject(e));
      req.write(requestBody);
      req.end();
    });

    const geminiResponse = JSON.parse(data);
    let generatedText = geminiResponse.candidates[0].content.parts[0].text;
    
    // Clean up potential markdown formatting that Gemini sometimes adds
    generatedText = generatedText.replace(/```json/g, '').replace(/```/g, '').trim();

    const phishTemplate = JSON.parse(generatedText);

    return {
      statusCode: 200,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(phishTemplate)
    };

  } catch (error) {
    console.error("Error generating phish:", error);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: "Failed to generate phishing simulation.", message: error.message })
    };
  }
};
