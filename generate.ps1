$serviceTemplate = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>{{TITLE}} &mdash; Prasad Sawant</title>
  <link rel="stylesheet" href="css/style.css" />
  <style>
    body { background: var(--ink); color: var(--paper); }
    body::after { display: none; }
    nav { background: rgba(10,12,15,0.9); border-bottom: 1px solid rgba(244,240,232,0.07); }
    .nav-logo { color: var(--paper); }
    .nav-links a { color: rgba(244,240,232,0.4); }
    .nav-links a:hover, .nav-links a.active { color: var(--paper); }
    .nav-contact { background: var(--paper); color: var(--ink) !important; }
    .nav-contact:hover { background: var(--accent) !important; color: white !important; }
    
    .service-hero {
      padding: 160px 64px 100px;
      min-height: 80vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      position: relative;
    }
    .service-hero::after {
      content: '';
      position: absolute;
      inset: 0;
      background-image: linear-gradient(rgba(244,240,232,0.02) 1px, transparent 1px), linear-gradient(90deg, rgba(244,240,232,0.02) 1px, transparent 1px);
      background-size: 48px 48px;
      pointer-events: none;
    }
    .sh-label { font-size: 10px; letter-spacing: 0.22em; text-transform: uppercase; color: var(--accent); margin-bottom: 24px; display: flex; align-items: center; gap: 14px; }
    .sh-label::before { content: ''; width: 26px; height: 1px; background: var(--accent); }
    .sh-title { font-family: var(--font-display); font-size: clamp(64px, 8vw, 120px); letter-spacing: 2px; line-height: 0.9; margin-bottom: 32px; color: var(--paper); }
    .sh-desc { font-size: 14px; color: rgba(244,240,232,0.6); max-width: 600px; line-height: 1.8; margin-bottom: 48px; }
    .sh-features { display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-top: 60px; padding-top: 60px; border-top: 1px solid rgba(244,240,232,0.1); max-width: 800px; }
    .shf-item h3 { font-family: var(--font-serif); font-size: 24px; color: var(--accent); margin-bottom: 12px; }
    .shf-item p { font-size: 12px; color: rgba(244,240,232,0.45); line-height: 1.7; }
    footer { background: #060809; }
  </style>
</head>
<body>
  <div id="cur"></div><div id="cur-r"></div>
  <nav>
    <a class="nav-logo" href="index.html">Prasad<span class="dot">.</span></a>
    <ul class="nav-links">
      <li><a href="index.html">Home</a></li>
      <li><a href="index.html#work" class="active">Work</a></li>
      <li><a href="index.html#training">Training</a></li>
      <li><a href="blog.html">Blog</a></li>
      <li><a href="index.html#about">About</a></li>
      <li><a class="nav-contact" href="index.html#contact">Contact</a></li>
    </ul>
  </nav>

  <header class="service-hero">
    <div style="position:relative; z-index:2;">
      <div class="sh-label">Service Offering</div>
      <h1 class="sh-title">{{TITLE}}</h1>
      <p class="sh-desc">{{DESC}}</p>
      <a class="btn btn-red" href="index.html#contact">Discuss a Project &rarr;</a>
      
      <div class="sh-features">
        <div class="shf-item">
          <h3>{{F1_T}}</h3>
          <p>{{F1_D}}</p>
        </div>
        <div class="shf-item">
          <h3>{{F2_T}}</h3>
          <p>{{F2_D}}</p>
        </div>
      </div>
    </div>
  </header>

  <footer>
    <div class="footer-name">Prasad Sawant</div>
    <div class="footer-links">
      <a href="index.html">Home</a>
      <a href="blog.html">Blog</a>
      <a href="index.html#contact">Contact</a>
    </div>
    <div class="footer-copy">&copy; 2025 Prasad Sawant</div>
  </footer>
  <script src="js/main.js"></script>
</body>
</html>
"@;

$services = @(
  @{
    file = 'c:/Users/Prasad/Downloads/prasad-sawant-portfolio/live-trainings.html'
    title = 'Live Trainings'
    desc = 'High-energy in-person and virtual sessions for audiences from 20 to 2,000+. Live threat demos, real-time phishing tests, interactive polls, and role-specific breakout discussions.'
    f1_t = 'In-Person & Virtual'
    f1_d = 'Customizable delivery models that suit global enterprises or localized teams, bridging the engagement gap online or in reality.'
    f2_t = 'Interactive Polling'
    f2_d = 'Live feedback metrics throughout the session capturing realtime sentiment of the workforce to adapt the session dynamically.'
  },
  @{
    file = 'c:/Users/Prasad/Downloads/prasad-sawant-portfolio/posters.html'
    title = 'Security Posters'
    desc = 'Campaign-grade visual assets that reinforce secure behaviour across physical and digital workspaces. Designed for maximum recall and cross-cultural adaptability.'
    f1_t = 'Print-Ready'
    f1_d = 'High-fidelity graphics prepared meticulously for CMYK print, scaling beautifully to any physical space or bulletin board.'
    f2_t = 'Digital Native'
    f2_d = 'Optimized digital assets perfect for corporate screensavers, intranet banners, or internal company chat channels.'
  },
  @{
    file = 'c:/Users/Prasad/Downloads/prasad-sawant-portfolio/videos.html'
    title = 'Explainer Videos'
    desc = 'Scenario-based videos that dramatise real attack chains. Animated, live-action, and hybrid formats built to hold attention and drive lasting recall.'
    f1_t = 'Animated Narratives'
    f1_d = 'Striking illustrations combined with rich storytelling that simplifies complex cybersecurity exploits into approachable narratives.'
    f2_t = 'Scenario-Based'
    f2_d = 'Rooted entirely in real-world scenarios rather than abstract theorizing, equipping users with real mental models of what vectors look like.'
  },
  @{
    file = 'c:/Users/Prasad/Downloads/prasad-sawant-portfolio/gamification.html'
    title = 'Gamification & E-Learning'
    desc = 'LMS-ready (SCORM/xAPI) modules combined with leaderboards, badges, digital escape rooms, and quizzes to transform mandatory compliance into competitive team-building experiences.'
    f1_t = 'Escape Rooms'
    f1_d = 'Fully immersive, high-stakes simulated cybersecurity escape rooms where teams solve puzzles that enforce security concepts.'
    f2_t = 'SCORM / xAPI'
    f2_d = 'Enterprise-compliant packaging ensuring modules seamlessly integrate with existing corporate Learning Management Systems.'
  }
)

foreach ($s in $services) {
  $content = $serviceTemplate -replace '\{\{TITLE\}\}', $s.title `
                             -replace '\{\{DESC\}\}', $s.desc `
                             -replace '\{\{F1_T\}\}', $s.f1_t `
                             -replace '\{\{F1_D\}\}', $s.f1_d `
                             -replace '\{\{F2_T\}\}', $s.f2_t `
                             -replace '\{\{F2_D\}\}', $s.f2_d
  [System.IO.File]::WriteAllText($s.file, $content, [System.Text.Encoding]::UTF8)
}

$blogTemplate = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>{{TITLE}} &mdash; Prasad Sawant</title>
  <link rel="stylesheet" href="css/style.css" />
  <style>
    /* Light Theme Template for Blogs */
    .blog-header {
      padding: 160px 64px 80px;
      max-width: 900px;
      margin: 0 auto;
    }
    .bh-meta { font-size: 11px; letter-spacing: 0.15em; text-transform: uppercase; color: var(--accent); margin-bottom: 24px; }
    .bh-title { font-family: var(--font-serif); font-size: clamp(42px, 5vw, 64px); line-height: 1.1; margin-bottom: 32px; color: var(--ink); font-weight: 600; }
    .bh-image { width: 100%; aspect-ratio: 21/9; background: var(--steel); margin-bottom: 60px; border-radius: 4px; border: 1px solid var(--border); box-shadow: 0 4px 20px rgba(10,12,15,0.03); }
    
    .blog-content {
      max-width: 720px;
      margin: 0 auto;
      padding: 0 24px 120px;
      color: var(--muted);
      font-size: 16px;
      line-height: 1.8;
      font-family: var(--font-body);
    }
    .blog-content p { margin-bottom: 24px; }
    .blog-content h2 { font-family: var(--font-serif); font-size: 32px; color: var(--ink); margin: 60px 0 24px; font-weight: 400; }
  </style>
</head>
<body>
  <div id="cur"></div><div id="cur-r"></div>
  <nav>
    <a class="nav-logo" href="index.html">Prasad<span class="dot">.</span></a>
    <ul class="nav-links">
      <li><a href="index.html">Home</a></li>
      <li><a href="index.html#work">Work</a></li>
      <li><a href="index.html#training">Training</a></li>
      <li><a href="blog.html" class="active">Blog</a></li>
      <li><a href="index.html#about">About</a></li>
      <li><a class="nav-contact" href="index.html#contact">Contact</a></li>
    </ul>
  </nav>

  <article>
    <header class="blog-header">
      <div class="bh-meta">{{DATE}} &nbsp;&middot;&nbsp; {{READ_TIME}} &nbsp;&middot;&nbsp; Prasad Sawant</div>
      <h1 class="bh-title">{{TITLE}}</h1>
      <div class="bh-image"></div>
    </header>
    <div class="blog-content">
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      <h2>The Core Issue</h2>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
      <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?</p>
      <h2>Looking Forward</h2>
      <p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.</p>
    </div>
  </article>

  <footer>
    <div class="footer-name">Prasad Sawant</div>
    <div class="footer-links">
      <a href="index.html">Home</a>
      <a href="blog.html">Blog</a>
      <a href="index.html#contact">Contact</a>
    </div>
    <div class="footer-copy">&copy; 2025 Prasad Sawant</div>
  </footer>
  <script src="js/main.js"></script>
</body>
</html>
"@;

$blogs = @(
  # EXCLUDE BLOG-SINGLE-1
  @{file='blog-single-2'; title='Security Escape Rooms: A Practitioners Guide to Running Them at Scale'; date='February 2025'; readTime='6 min read'},
  @{file='blog-single-3'; title='The 5-Minute Rule: Designing Micro-Learning for Busy Employees'; date='January 2025'; readTime='5 min read'},
  @{file='blog-single-4'; title='From Compliance to Culture: A Security Leaders Practical Roadmap'; date='December 2024'; readTime='7 min read'},
  @{file='blog-single-5'; title='SCORM vs xAPI in 2025: Which Standard Actually Serves Security Awareness?'; date='November 2024'; readTime='4 min read'},
  @{file='blog-single-6'; title='What 25,000 Trained Users Taught Me About Human Risk'; date='October 2024'; readTime='10 min read'},
  @{file='blog-single-7'; title='The Anatomy of a Perfect Phishing Template: What Makes Employees Click'; date='September 2024'; readTime='6 min read'},
  @{file='blog-single-8'; title='Designing for Sceptics: How to Engage the Hardest Employees to Train'; date='August 2024'; readTime='5 min read'},
  @{file='blog-single-9'; title='Measuring Security Culture: Beyond Click Rates and Completion Certificates'; date='July 2024'; readTime='8 min read'},
  @{file='blog-single-10'; title='Points, Badges, Leaderboards: When Gamification Backfires in Security Training'; date='June 2024'; readTime='7 min read'}
)

foreach ($b in $blogs) {
  $content = $blogTemplate -replace '\{\{TITLE\}\}', $b.title `
                           -replace '\{\{DATE\}\}', $b.date `
                           -replace '\{\{READ_TIME\}\}', $b.readTime
  $path = "c:/Users/Prasad/Downloads/prasad-sawant-portfolio/" + $b.file + ".html"
  [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
}
Write-Host "Generated successfully!"
