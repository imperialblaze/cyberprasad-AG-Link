exports.handler = async function (event, context) {
  // This code runs securely on Netlify's backend servers, NOT in the browser
  const targetUrl = event.queryStringParameters.url;
  
  if (!targetUrl) {
    return {
      statusCode: 400,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ error: 'URL parameter is missing' })
    };
  }

  // Safely retrieve the PRIVATE API KEY from Netlify's Environment Variables
  const apiKey = process.env.VIRUSTOTAL_API_KEY;
  
  if (!apiKey) {
    return {
      statusCode: 500,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ error: 'Server configuration error: Missing API Key' })
    };
  }

  try {
    // Format the URL exactly how VirusTotal requires it (Base64 URL encoded)
    const urlId = Buffer.from(targetUrl).toString('base64').replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_');

    // Make the secure request to VirusTotal API
    const response = await fetch(`https://www.virustotal.com/api/v3/urls/${urlId}`, {
      method: 'GET',
      headers: {
        'x-apikey': apiKey,
        'Accept': 'application/json'
      }
    });

    if (response.status === 404) {
      return {
        statusCode: 200,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status: 'unrated', message: 'This URL has not been scanned by VirusTotal yet.' })
      };
    }

    if (!response.ok) {
      return {
        statusCode: response.status,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ error: 'Error querying VirusTotal' })
      };
    }

    const data = await response.json();
    
    return {
      statusCode: 200,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        status: 'success',
        data: data.data
      })
    };

  } catch (error) {
    return {
      statusCode: 500,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ error: 'Internal Server Error', details: error.message })
    };
  }
};
