<!DOCTYPE html>
<html class="  ">
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>A very simple/crude TMX (tiled) loader, which uses Starling and Haxe.  It only supports image collections (provided from an AssetManager), and uncompressed XML tiles.</title>

  <meta content="authenticity_token" name="csrf-param" />
<meta content="1V3UwKzTmZiWVrLUjZXpeUCkGNzNgfe/fpjKcfj0/FrEfzsyKqdwgo5ushRQt3im0JSL2S6Z1cw/VDdsk3HRmQ==" name="csrf-token" />
  <meta name="viewport" content="width=960">


    <link type="text/plain" rel="author" href="https://github.com/humans.txt" />
    <meta content="gist" name="octolytics-app-id" /><meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="18CEEC7B:12BB:346C7B:55144D1C" name="octolytics-dimension-request_id" /><meta content="6947714" name="octolytics-actor-id" /><meta content="breadraptor" name="octolytics-actor-login" /><meta content="317a745946783b556aee35a8638ae6490f3b2e7403934257e933520414355d4e" name="octolytics-actor-hash" />
  <link rel="assets" href="https://gist-assets.github.com/">
  <link rel="zeroclipboard-assets" href="https://gist-assets.github.com/assets/zeroclipboard/dist/ZeroClipboard-aeb54c213f0d09883fed5a0947132da9.swf">
  <link rel="editor-assets" href="https://gist-assets.github.com/assets/editor-cac2d04c8f22b5ffe38f6bc97dc54f54.js">
  <link rel="mount-point" href="/">


  <link href="https://gist-assets.github.com/assets/application-0622f4c051642df21ab90d3eb66a52b8.css" media="screen, print" rel="stylesheet" />
  <script src="https://gist-assets.github.com/assets/application-9441728a90e54c65c8d4079bfabcbff5.js"></script>

      <meta name="twitter:card" content="summary">
  <meta name="twitter:site" content="@github">
  <meta property="og:title" content="jdpalmer/Tilemap.hx">
  <meta property="og:type" content="githubog:gist">
  <meta property="og:url" content="https://gist.github.com/jdpalmer/ad30293d0bcc3f0706c5">
  <meta property="og:image" content="https://avatars0.githubusercontent.com/u/526210?s=140">
  <meta property="og:site_name" content="GitHub Gists">
  <meta property="og:description" content="A very simple/crude TMX (tiled) loader, which uses Starling and Haxe.  It only supports image collections (provided from an AssetManager), and uncompressed XML tiles. - Gist is a simple way to share snippets of text and code with others.">
  <meta name="description" content="A very simple/crude TMX (tiled) loader, which uses Starling and Haxe.  It only supports image collections (provided from an AssetManager), and uncompressed XML tiles. - Gist is a simple way to share snippets of text and code with others.">


</head>

<body class="logged_in "
  data-plan="">

  <div id="wrapper">
    

    <div id="header" class="header header-logged-in">
      <div class="container clearfix">
        <a class="header-logo-wordmark" href="https://gist.github.com/">
          <span class="octicon octicon-logo-github"></span>
          <span class="octicon-logo octicon-logo-gist"></span>
        </a>

        <div class="divider-vertical"></div>
        <div class="topsearch">
  <form id="top_search_form" action="/search" data-pjax-remote=push accept-charset="UTF-8">
    <div class="search">
      <input type="text" class="search js-search js-navigation-enable js-quick-search" name="q" placeholder="Search&#x2026;" data-hotkey="/" autocomplete=off autocorrect=off value="" >

      <div class="search-results js-search-results js-navigation-container"></div>
    </div>
    <div class="divider-vertical"></div>
  </form>
  <ul class="top-nav">
    <li class="explore"><a href="/discover">All Gists</a></li>
  </ul>
</div>

        <ul id="user-links">
  <li>
  <a href="/breadraptor" class="name">
    <img src="https://avatars1.githubusercontent.com/u/6947714?s=140" width="20" height="20"> breadraptor
  </a>
  </li>
  <li>
  <a href="/" id="new_gist" class="tooltipped tooltipped-s" aria-label="New Gist">
    <span class="octicon octicon-gist-new"></span>
  </a>
  </li>
  <li>
  <a href="https://github.com" class="tooltipped tooltipped-s" aria-label="Go to GitHub" data-skip-pjax>
    <span class="octicon octicon-octoface"></span>
  </a>
  </li>
  <li>
  <form action="/logout" method="post">
    <input name="authenticity_token" type="hidden" value="vZLTNldiFgoNaT9JlpSw3EtyyA9PXSsZHewZF3Nn/9qssDzE0Rb/EBVRP4lLtiED20JbCqxFCWpcIOQKGOLSGQ==" />
    <button class="logout-button tooltipped tooltipped-s" id="logout" type="submit" aria-label="Sign out">
      <span class="octicon octicon-log-out"></span>
    </button>
  </form>
  </li>
</ul>

      </div>
    </div>

    <div class="site-content" id="js-pjax-container" data-pjax-container>
      <div id="js-flash-container" class="site-container js-site-container" data-url="/jdpalmer/ad30293d0bcc3f0706c5">
  
  

<meta content="true" name="octolytics-dimension-public" /><meta content="20255843" name="octolytics-dimension-gist_id" /><meta content="ad30293d0bcc3f0706c5" name="octolytics-dimension-gist_name" /><meta content="false" name="octolytics-dimension-anonymous" /><meta content="526210" name="octolytics-dimension-owner_id" /><meta content="jdpalmer" name="octolytics-dimension-owner_login" /><meta content="false" name="octolytics-dimension-forked" />

<div class="pagehead repohead">
  <div class="container">
    <div class="title-actions-bar">
      <ul class="pagehead-actions">
            <li>
              <div class="gist-advanced-options select-menu js-menu-container js-select-menu">

                <span class="minibutton select-menu-button js-menu-target">
                  <span class="octicon octicon-gear"></span>
                </span>

                <div class="select-menu-modal-holder js-menu-content js-navigation-container js-select-menu-pane">
                  <div class="select-menu-modal">
                    <div class="select-menu-header">
                      <span class="select-menu-title">Advanced options</span>
                      <span class="octicon octicon-x js-menu-close"></span>
                    </div> <!-- /.select-menu-header -->

                    <div class="select-menu-list">

                      <div class="select-menu-item js-navigation-item">
                        <div class="select-menu-item-text js-navigation-open">
                          <a href="/jdpalmer/ad30293d0bcc3f0706c5/report" data-method="post" data-skip-pjax>Report as abuse</a>
                        </div>
                      </div> <!-- /.select-menu-item -->

                    </div> <!-- /.select-menu-list -->

                  </div> <!-- /.select-menu-modal -->
                </div> <!-- /.select-menu-modal-holder -->
              </div> <!-- /.select-menu -->
            </li>
          <li>
              <form action="/jdpalmer/ad30293d0bcc3f0706c5/star" data-pjax-remote=replace method="post" accept-charset="UTF-8">
                <input name="authenticity_token" type="hidden" value="poD7axJ4vVAW1Scd5MvfLvPUJtkoYqJ/lxYoOkjJSoe3ohSZlAxUSg7tJ9056U7xY+S13Mt6gAzW2tUnI0xnRA==" />
                <button class="minibutton with-count" type="submit"><span class="octicon octicon-star"></span>Star</button>
                  <span class="social-count">0</span>
              </form>
          </li>
          <li>
            <form action="/jdpalmer/ad30293d0bcc3f0706c5/fork" data-method="post" method="post" accept-charset="UTF-8">
              <button class="minibutton with-count fork-button" type="submit"><span class="octicon octicon-repo-forked"></span>Fork</button>
              <span class="social-count">0</span>
            </form>
          </li>

      </ul>
      <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title ">
  <div class="meta">
    <div class="gist-author">
      <img src="https://avatars0.githubusercontent.com/u/526210?s=140" width="26" height="26">
        <span class="author vcard">
            <span itemprop="title"><a href="/jdpalmer">jdpalmer</a></span>
        </span> /
      <strong><a href="/jdpalmer/ad30293d0bcc3f0706c5" class="js-current-repository">Tilemap.hx</a></strong>
    </div>
    <div class="gist-timestamp">
        <span class="datetime">Created <time datetime="2015-03-11T17:10:19Z" is="relative-time">March 11, 2015</time></span>
    </div>
</h1>

    </div>

  </div>
</div>


<div class="container">
  <div class="gist js-gist-container gist-with-sidebar with-full-navigation"
    data-version="b38ed5abc69622859d996036663a7f6fa750a7f4"
    data-created="false"
    data-updated="false">

      <div class="gist-sidebar clearfix">
  <div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders">
    <div class="sunken-menu-contents">
      <ul class="sunken-menu-group">
        <li class="tooltipped tooltipped-w" aria-label="Code">
          <a aria-label="Code" class="sunken-menu-item selected" data-pjax="true" href="/jdpalmer/ad30293d0bcc3f0706c5">
            <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
            <img alt="" class="mini-loader" height="16" src="https://gist-assets.github.com/assets/spinners/octocat-spinner-32-ad13d0fd1814c3fda3b5018da94432ea.gif" width="16" />
</a>        </li>

          <li class="tooltipped tooltipped-w" aria-label="Revisions">
            <a aria-label="Revisions" class="sunken-menu-item" data-pjax="true" href="/jdpalmer/ad30293d0bcc3f0706c5/revisions">
              <span class="octicon octicon-git-commit"></span> <span class="full-word">Revisions</span>
              <img alt="" class="mini-loader" height="16" src="https://gist-assets.github.com/assets/spinners/octocat-spinner-32-ad13d0fd1814c3fda3b5018da94432ea.gif" width="16" />
              <span class='counter'>1</span>
</a>          </li>


      </ul>
    </div><!-- /.sunken-menu-group -->
  </div><!-- /.sunken-menu-contents -->

  <div class="only-with-full-nav">

    <div class="embed-url open" style="display: block;">
      <h3><strong>Embed</strong> URL</h3>
      <div class="clone-url-box">
        <input type="text" class="clone js-url-field" value="&lt;script src=&quot;https://gist.github.com/jdpalmer/ad30293d0bcc3f0706c5.js&quot;&gt;&lt;/script&gt;" readonly="readonly">
        <span class="url-box-clippy">
          <button aria-label="copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="&lt;script src=&quot;https://gist.github.com/jdpalmer/ad30293d0bcc3f0706c5.js&quot;&gt;&lt;/script&gt;" data-copied-hint="copied!" type="button"><span class="octicon octicon-clippy"></span></button>
        </span>
      </div>
    </div>
    <p class="clone-options"></p>

      
<div class="clone-url open" data-protocol-type="http" data-url="https://gist.github.com/ad30293d0bcc3f0706c5.git">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone url-field js-url-field" value="https://gist.github.com/ad30293d0bcc3f0706c5.git" readonly="readonly">
    <span class="url-box-clippy">
      <button aria-label="copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://gist.github.com/ad30293d0bcc3f0706c5.git" data-copied-hint="copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url " data-protocol-type="ssh" data-url="git@gist.github.com:/ad30293d0bcc3f0706c5.git">
  <h3><strong>SSH</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone url-field js-url-field" value="git@gist.github.com:/ad30293d0bcc3f0706c5.git" readonly="readonly">
    <span class="url-box-clippy">
      <button aria-label="copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="git@gist.github.com:/ad30293d0bcc3f0706c5.git" data-copied-hint="copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-skip-pjax data-protocol="http">HTTPS</a>
      or <a href="#" class="js-clone-selector" data-skip-pjax data-protocol="ssh">SSH</a>.
</p>


    <a aria-label="Download Tilemap.hx as a zip file" class="minibutton sidebar-button" href="/jdpalmer/ad30293d0bcc3f0706c5/download" rel="nofollow" title="Download Tilemap.hx as a zip file">
      <span class="octicon octicon-cloud-download"></span>
      Download Gist
</a>  </div><!-- /.only-with-full-nav -->

</div>


    <div class="gist-content">
          <div class="gist-meta">
            <div class="gist-description">
              <p><div>A very simple/crude TMX (tiled) loader, which uses Starling and Haxe.  It only supports image collections (provided from an AssetManager), and uncompressed XML tiles.</div></p>
            </div>
          </div>

      <div class="files">
            <div id="file-tilemap-hx" class="file ">
    <a href="/jdpalmer/ad30293d0bcc3f0706c5" class="link-overlay">
    <span class="link">View <strong>Tilemap.hx</strong> <span class="octicon octicon-arrow-right"></span></span>
  </a>
  <div class="meta clearfix">
    <div class="info file-name">
      <span class="icon">
        <b class="octicon octicon-gist"></b>
      </span>
      <a aria-label="Permalink" href="#file-tilemap-hx" class="tooltipped tooltipped-s permalink"><strong class="file-name js-selectable-text">Tilemap.hx</strong></a>
    </div>
    <div class="actions">
      <div class="button-group">
        <a aria-label="View Raw"
          href="/jdpalmer/ad30293d0bcc3f0706c5/raw/d1c3dd527a3814d24fa40e1a2057d32c6f3fb9f3/Tilemap.hx"
          data-skip-pjax class="minibutton raw-url js-view-raw">Raw</a>
      </div>
    </div>
  </div>
  <div class="suppressed">
    <a class="js-show-suppressed-file">File suppressed. Click to show.</a>
  </div>
  <div class="blob-wrapper data type-haxe js-blob-data">
    



    <div class="file-data">
      <table cellpadding="0" cellspacing="0" class="lines highlight">
        <tr>
          <td class="line-numbers">
            <span class="line-number" id="file-tilemap-hx-L1" rel="file-tilemap-hx-L1">1</span>
            <span class="line-number" id="file-tilemap-hx-L2" rel="file-tilemap-hx-L2">2</span>
            <span class="line-number" id="file-tilemap-hx-L3" rel="file-tilemap-hx-L3">3</span>
            <span class="line-number" id="file-tilemap-hx-L4" rel="file-tilemap-hx-L4">4</span>
            <span class="line-number" id="file-tilemap-hx-L5" rel="file-tilemap-hx-L5">5</span>
            <span class="line-number" id="file-tilemap-hx-L6" rel="file-tilemap-hx-L6">6</span>
            <span class="line-number" id="file-tilemap-hx-L7" rel="file-tilemap-hx-L7">7</span>
            <span class="line-number" id="file-tilemap-hx-L8" rel="file-tilemap-hx-L8">8</span>
            <span class="line-number" id="file-tilemap-hx-L9" rel="file-tilemap-hx-L9">9</span>
            <span class="line-number" id="file-tilemap-hx-L10" rel="file-tilemap-hx-L10">10</span>
            <span class="line-number" id="file-tilemap-hx-L11" rel="file-tilemap-hx-L11">11</span>
            <span class="line-number" id="file-tilemap-hx-L12" rel="file-tilemap-hx-L12">12</span>
            <span class="line-number" id="file-tilemap-hx-L13" rel="file-tilemap-hx-L13">13</span>
            <span class="line-number" id="file-tilemap-hx-L14" rel="file-tilemap-hx-L14">14</span>
            <span class="line-number" id="file-tilemap-hx-L15" rel="file-tilemap-hx-L15">15</span>
            <span class="line-number" id="file-tilemap-hx-L16" rel="file-tilemap-hx-L16">16</span>
            <span class="line-number" id="file-tilemap-hx-L17" rel="file-tilemap-hx-L17">17</span>
            <span class="line-number" id="file-tilemap-hx-L18" rel="file-tilemap-hx-L18">18</span>
            <span class="line-number" id="file-tilemap-hx-L19" rel="file-tilemap-hx-L19">19</span>
            <span class="line-number" id="file-tilemap-hx-L20" rel="file-tilemap-hx-L20">20</span>
            <span class="line-number" id="file-tilemap-hx-L21" rel="file-tilemap-hx-L21">21</span>
            <span class="line-number" id="file-tilemap-hx-L22" rel="file-tilemap-hx-L22">22</span>
            <span class="line-number" id="file-tilemap-hx-L23" rel="file-tilemap-hx-L23">23</span>
            <span class="line-number" id="file-tilemap-hx-L24" rel="file-tilemap-hx-L24">24</span>
            <span class="line-number" id="file-tilemap-hx-L25" rel="file-tilemap-hx-L25">25</span>
            <span class="line-number" id="file-tilemap-hx-L26" rel="file-tilemap-hx-L26">26</span>
            <span class="line-number" id="file-tilemap-hx-L27" rel="file-tilemap-hx-L27">27</span>
            <span class="line-number" id="file-tilemap-hx-L28" rel="file-tilemap-hx-L28">28</span>
            <span class="line-number" id="file-tilemap-hx-L29" rel="file-tilemap-hx-L29">29</span>
            <span class="line-number" id="file-tilemap-hx-L30" rel="file-tilemap-hx-L30">30</span>
            <span class="line-number" id="file-tilemap-hx-L31" rel="file-tilemap-hx-L31">31</span>
            <span class="line-number" id="file-tilemap-hx-L32" rel="file-tilemap-hx-L32">32</span>
            <span class="line-number" id="file-tilemap-hx-L33" rel="file-tilemap-hx-L33">33</span>
            <span class="line-number" id="file-tilemap-hx-L34" rel="file-tilemap-hx-L34">34</span>
            <span class="line-number" id="file-tilemap-hx-L35" rel="file-tilemap-hx-L35">35</span>
            <span class="line-number" id="file-tilemap-hx-L36" rel="file-tilemap-hx-L36">36</span>
            <span class="line-number" id="file-tilemap-hx-L37" rel="file-tilemap-hx-L37">37</span>
            <span class="line-number" id="file-tilemap-hx-L38" rel="file-tilemap-hx-L38">38</span>
            <span class="line-number" id="file-tilemap-hx-L39" rel="file-tilemap-hx-L39">39</span>
            <span class="line-number" id="file-tilemap-hx-L40" rel="file-tilemap-hx-L40">40</span>
            <span class="line-number" id="file-tilemap-hx-L41" rel="file-tilemap-hx-L41">41</span>
            <span class="line-number" id="file-tilemap-hx-L42" rel="file-tilemap-hx-L42">42</span>
            <span class="line-number" id="file-tilemap-hx-L43" rel="file-tilemap-hx-L43">43</span>
            <span class="line-number" id="file-tilemap-hx-L44" rel="file-tilemap-hx-L44">44</span>
            <span class="line-number" id="file-tilemap-hx-L45" rel="file-tilemap-hx-L45">45</span>
            <span class="line-number" id="file-tilemap-hx-L46" rel="file-tilemap-hx-L46">46</span>
            <span class="line-number" id="file-tilemap-hx-L47" rel="file-tilemap-hx-L47">47</span>
            <span class="line-number" id="file-tilemap-hx-L48" rel="file-tilemap-hx-L48">48</span>
            <span class="line-number" id="file-tilemap-hx-L49" rel="file-tilemap-hx-L49">49</span>
            <span class="line-number" id="file-tilemap-hx-L50" rel="file-tilemap-hx-L50">50</span>
            <span class="line-number" id="file-tilemap-hx-L51" rel="file-tilemap-hx-L51">51</span>
            <span class="line-number" id="file-tilemap-hx-L52" rel="file-tilemap-hx-L52">52</span>
            <span class="line-number" id="file-tilemap-hx-L53" rel="file-tilemap-hx-L53">53</span>
            <span class="line-number" id="file-tilemap-hx-L54" rel="file-tilemap-hx-L54">54</span>
            <span class="line-number" id="file-tilemap-hx-L55" rel="file-tilemap-hx-L55">55</span>
            <span class="line-number" id="file-tilemap-hx-L56" rel="file-tilemap-hx-L56">56</span>
            <span class="line-number" id="file-tilemap-hx-L57" rel="file-tilemap-hx-L57">57</span>
            <span class="line-number" id="file-tilemap-hx-L58" rel="file-tilemap-hx-L58">58</span>
            <span class="line-number" id="file-tilemap-hx-L59" rel="file-tilemap-hx-L59">59</span>
            <span class="line-number" id="file-tilemap-hx-L60" rel="file-tilemap-hx-L60">60</span>
            <span class="line-number" id="file-tilemap-hx-L61" rel="file-tilemap-hx-L61">61</span>
            <span class="line-number" id="file-tilemap-hx-L62" rel="file-tilemap-hx-L62">62</span>
            <span class="line-number" id="file-tilemap-hx-L63" rel="file-tilemap-hx-L63">63</span>
            <span class="line-number" id="file-tilemap-hx-L64" rel="file-tilemap-hx-L64">64</span>
            <span class="line-number" id="file-tilemap-hx-L65" rel="file-tilemap-hx-L65">65</span>
            <span class="line-number" id="file-tilemap-hx-L66" rel="file-tilemap-hx-L66">66</span>
            <span class="line-number" id="file-tilemap-hx-L67" rel="file-tilemap-hx-L67">67</span>
            <span class="line-number" id="file-tilemap-hx-L68" rel="file-tilemap-hx-L68">68</span>
            <span class="line-number" id="file-tilemap-hx-L69" rel="file-tilemap-hx-L69">69</span>
            <span class="line-number" id="file-tilemap-hx-L70" rel="file-tilemap-hx-L70">70</span>
            <span class="line-number" id="file-tilemap-hx-L71" rel="file-tilemap-hx-L71">71</span>
            <span class="line-number" id="file-tilemap-hx-L72" rel="file-tilemap-hx-L72">72</span>
            <span class="line-number" id="file-tilemap-hx-L73" rel="file-tilemap-hx-L73">73</span>
            <span class="line-number" id="file-tilemap-hx-L74" rel="file-tilemap-hx-L74">74</span>
            <span class="line-number" id="file-tilemap-hx-L75" rel="file-tilemap-hx-L75">75</span>
            <span class="line-number" id="file-tilemap-hx-L76" rel="file-tilemap-hx-L76">76</span>
            <span class="line-number" id="file-tilemap-hx-L77" rel="file-tilemap-hx-L77">77</span>
            <span class="line-number" id="file-tilemap-hx-L78" rel="file-tilemap-hx-L78">78</span>
            <span class="line-number" id="file-tilemap-hx-L79" rel="file-tilemap-hx-L79">79</span>
            <span class="line-number" id="file-tilemap-hx-L80" rel="file-tilemap-hx-L80">80</span>
            <span class="line-number" id="file-tilemap-hx-L81" rel="file-tilemap-hx-L81">81</span>
            <span class="line-number" id="file-tilemap-hx-L82" rel="file-tilemap-hx-L82">82</span>
            <span class="line-number" id="file-tilemap-hx-L83" rel="file-tilemap-hx-L83">83</span>
            <span class="line-number" id="file-tilemap-hx-L84" rel="file-tilemap-hx-L84">84</span>
            <span class="line-number" id="file-tilemap-hx-L85" rel="file-tilemap-hx-L85">85</span>
            <span class="line-number" id="file-tilemap-hx-L86" rel="file-tilemap-hx-L86">86</span>
            <span class="line-number" id="file-tilemap-hx-L87" rel="file-tilemap-hx-L87">87</span>
            <span class="line-number" id="file-tilemap-hx-L88" rel="file-tilemap-hx-L88">88</span>
            <span class="line-number" id="file-tilemap-hx-L89" rel="file-tilemap-hx-L89">89</span>
            <span class="line-number" id="file-tilemap-hx-L90" rel="file-tilemap-hx-L90">90</span>
            <span class="line-number" id="file-tilemap-hx-L91" rel="file-tilemap-hx-L91">91</span>
            <span class="line-number" id="file-tilemap-hx-L92" rel="file-tilemap-hx-L92">92</span>
            <span class="line-number" id="file-tilemap-hx-L93" rel="file-tilemap-hx-L93">93</span>
            <span class="line-number" id="file-tilemap-hx-L94" rel="file-tilemap-hx-L94">94</span>
            <span class="line-number" id="file-tilemap-hx-L95" rel="file-tilemap-hx-L95">95</span>
            <span class="line-number" id="file-tilemap-hx-L96" rel="file-tilemap-hx-L96">96</span>
            <span class="line-number" id="file-tilemap-hx-L97" rel="file-tilemap-hx-L97">97</span>
            <span class="line-number" id="file-tilemap-hx-L98" rel="file-tilemap-hx-L98">98</span>
            <span class="line-number" id="file-tilemap-hx-L99" rel="file-tilemap-hx-L99">99</span>
            <span class="line-number" id="file-tilemap-hx-L100" rel="file-tilemap-hx-L100">100</span>
            <span class="line-number" id="file-tilemap-hx-L101" rel="file-tilemap-hx-L101">101</span>
            <span class="line-number" id="file-tilemap-hx-L102" rel="file-tilemap-hx-L102">102</span>
            <span class="line-number" id="file-tilemap-hx-L103" rel="file-tilemap-hx-L103">103</span>
            <span class="line-number" id="file-tilemap-hx-L104" rel="file-tilemap-hx-L104">104</span>
            <span class="line-number" id="file-tilemap-hx-L105" rel="file-tilemap-hx-L105">105</span>
            <span class="line-number" id="file-tilemap-hx-L106" rel="file-tilemap-hx-L106">106</span>
            <span class="line-number" id="file-tilemap-hx-L107" rel="file-tilemap-hx-L107">107</span>
            <span class="line-number" id="file-tilemap-hx-L108" rel="file-tilemap-hx-L108">108</span>
            <span class="line-number" id="file-tilemap-hx-L109" rel="file-tilemap-hx-L109">109</span>
            <span class="line-number" id="file-tilemap-hx-L110" rel="file-tilemap-hx-L110">110</span>
            <span class="line-number" id="file-tilemap-hx-L111" rel="file-tilemap-hx-L111">111</span>
            <span class="line-number" id="file-tilemap-hx-L112" rel="file-tilemap-hx-L112">112</span>
            <span class="line-number" id="file-tilemap-hx-L113" rel="file-tilemap-hx-L113">113</span>
            <span class="line-number" id="file-tilemap-hx-L114" rel="file-tilemap-hx-L114">114</span>
            <span class="line-number" id="file-tilemap-hx-L115" rel="file-tilemap-hx-L115">115</span>
            <span class="line-number" id="file-tilemap-hx-L116" rel="file-tilemap-hx-L116">116</span>
            <span class="line-number" id="file-tilemap-hx-L117" rel="file-tilemap-hx-L117">117</span>
            <span class="line-number" id="file-tilemap-hx-L118" rel="file-tilemap-hx-L118">118</span>
            <span class="line-number" id="file-tilemap-hx-L119" rel="file-tilemap-hx-L119">119</span>
            <span class="line-number" id="file-tilemap-hx-L120" rel="file-tilemap-hx-L120">120</span>
            <span class="line-number" id="file-tilemap-hx-L121" rel="file-tilemap-hx-L121">121</span>
            <span class="line-number" id="file-tilemap-hx-L122" rel="file-tilemap-hx-L122">122</span>
            <span class="line-number" id="file-tilemap-hx-L123" rel="file-tilemap-hx-L123">123</span>
            <span class="line-number" id="file-tilemap-hx-L124" rel="file-tilemap-hx-L124">124</span>
            <span class="line-number" id="file-tilemap-hx-L125" rel="file-tilemap-hx-L125">125</span>
            <span class="line-number" id="file-tilemap-hx-L126" rel="file-tilemap-hx-L126">126</span>
            <span class="line-number" id="file-tilemap-hx-L127" rel="file-tilemap-hx-L127">127</span>
            <span class="line-number" id="file-tilemap-hx-L128" rel="file-tilemap-hx-L128">128</span>
            <span class="line-number" id="file-tilemap-hx-L129" rel="file-tilemap-hx-L129">129</span>
            <span class="line-number" id="file-tilemap-hx-L130" rel="file-tilemap-hx-L130">130</span>
            <span class="line-number" id="file-tilemap-hx-L131" rel="file-tilemap-hx-L131">131</span>
            <span class="line-number" id="file-tilemap-hx-L132" rel="file-tilemap-hx-L132">132</span>
            <span class="line-number" id="file-tilemap-hx-L133" rel="file-tilemap-hx-L133">133</span>
            <span class="line-number" id="file-tilemap-hx-L134" rel="file-tilemap-hx-L134">134</span>
            <span class="line-number" id="file-tilemap-hx-L135" rel="file-tilemap-hx-L135">135</span>
            <span class="line-number" id="file-tilemap-hx-L136" rel="file-tilemap-hx-L136">136</span>
            <span class="line-number" id="file-tilemap-hx-L137" rel="file-tilemap-hx-L137">137</span>
            <span class="line-number" id="file-tilemap-hx-L138" rel="file-tilemap-hx-L138">138</span>
            <span class="line-number" id="file-tilemap-hx-L139" rel="file-tilemap-hx-L139">139</span>
            <span class="line-number" id="file-tilemap-hx-L140" rel="file-tilemap-hx-L140">140</span>
            <span class="line-number" id="file-tilemap-hx-L141" rel="file-tilemap-hx-L141">141</span>
            <span class="line-number" id="file-tilemap-hx-L142" rel="file-tilemap-hx-L142">142</span>
            <span class="line-number" id="file-tilemap-hx-L143" rel="file-tilemap-hx-L143">143</span>
            <span class="line-number" id="file-tilemap-hx-L144" rel="file-tilemap-hx-L144">144</span>
            <span class="line-number" id="file-tilemap-hx-L145" rel="file-tilemap-hx-L145">145</span>
            <span class="line-number" id="file-tilemap-hx-L146" rel="file-tilemap-hx-L146">146</span>
            <span class="line-number" id="file-tilemap-hx-L147" rel="file-tilemap-hx-L147">147</span>
            <span class="line-number" id="file-tilemap-hx-L148" rel="file-tilemap-hx-L148">148</span>
            <span class="line-number" id="file-tilemap-hx-L149" rel="file-tilemap-hx-L149">149</span>
            <span class="line-number" id="file-tilemap-hx-L150" rel="file-tilemap-hx-L150">150</span>
            <span class="line-number" id="file-tilemap-hx-L151" rel="file-tilemap-hx-L151">151</span>
            <span class="line-number" id="file-tilemap-hx-L152" rel="file-tilemap-hx-L152">152</span>
            <span class="line-number" id="file-tilemap-hx-L153" rel="file-tilemap-hx-L153">153</span>
            <span class="line-number" id="file-tilemap-hx-L154" rel="file-tilemap-hx-L154">154</span>
            <span class="line-number" id="file-tilemap-hx-L155" rel="file-tilemap-hx-L155">155</span>
            <span class="line-number" id="file-tilemap-hx-L156" rel="file-tilemap-hx-L156">156</span>
            <span class="line-number" id="file-tilemap-hx-L157" rel="file-tilemap-hx-L157">157</span>
            <span class="line-number" id="file-tilemap-hx-L158" rel="file-tilemap-hx-L158">158</span>
            <span class="line-number" id="file-tilemap-hx-L159" rel="file-tilemap-hx-L159">159</span>
            <span class="line-number" id="file-tilemap-hx-L160" rel="file-tilemap-hx-L160">160</span>
            <span class="line-number" id="file-tilemap-hx-L161" rel="file-tilemap-hx-L161">161</span>
            <span class="line-number" id="file-tilemap-hx-L162" rel="file-tilemap-hx-L162">162</span>
            <span class="line-number" id="file-tilemap-hx-L163" rel="file-tilemap-hx-L163">163</span>
            <span class="line-number" id="file-tilemap-hx-L164" rel="file-tilemap-hx-L164">164</span>
            <span class="line-number" id="file-tilemap-hx-L165" rel="file-tilemap-hx-L165">165</span>
            <span class="line-number" id="file-tilemap-hx-L166" rel="file-tilemap-hx-L166">166</span>
            <span class="line-number" id="file-tilemap-hx-L167" rel="file-tilemap-hx-L167">167</span>
            <span class="line-number" id="file-tilemap-hx-L168" rel="file-tilemap-hx-L168">168</span>
            <span class="line-number" id="file-tilemap-hx-L169" rel="file-tilemap-hx-L169">169</span>
            <span class="line-number" id="file-tilemap-hx-L170" rel="file-tilemap-hx-L170">170</span>
            <span class="line-number" id="file-tilemap-hx-L171" rel="file-tilemap-hx-L171">171</span>
            <span class="line-number" id="file-tilemap-hx-L172" rel="file-tilemap-hx-L172">172</span>
            <span class="line-number" id="file-tilemap-hx-L173" rel="file-tilemap-hx-L173">173</span>
            <span class="line-number" id="file-tilemap-hx-L174" rel="file-tilemap-hx-L174">174</span>
            <span class="line-number" id="file-tilemap-hx-L175" rel="file-tilemap-hx-L175">175</span>
            <span class="line-number" id="file-tilemap-hx-L176" rel="file-tilemap-hx-L176">176</span>
            <span class="line-number" id="file-tilemap-hx-L177" rel="file-tilemap-hx-L177">177</span>
            <span class="line-number" id="file-tilemap-hx-L178" rel="file-tilemap-hx-L178">178</span>
            <span class="line-number" id="file-tilemap-hx-L179" rel="file-tilemap-hx-L179">179</span>
            <span class="line-number" id="file-tilemap-hx-L180" rel="file-tilemap-hx-L180">180</span>
            <span class="line-number" id="file-tilemap-hx-L181" rel="file-tilemap-hx-L181">181</span>
            <span class="line-number" id="file-tilemap-hx-L182" rel="file-tilemap-hx-L182">182</span>
            <span class="line-number" id="file-tilemap-hx-L183" rel="file-tilemap-hx-L183">183</span>
            <span class="line-number" id="file-tilemap-hx-L184" rel="file-tilemap-hx-L184">184</span>
            <span class="line-number" id="file-tilemap-hx-L185" rel="file-tilemap-hx-L185">185</span>
            <span class="line-number" id="file-tilemap-hx-L186" rel="file-tilemap-hx-L186">186</span>
            <span class="line-number" id="file-tilemap-hx-L187" rel="file-tilemap-hx-L187">187</span>
            <span class="line-number" id="file-tilemap-hx-L188" rel="file-tilemap-hx-L188">188</span>
            <span class="line-number" id="file-tilemap-hx-L189" rel="file-tilemap-hx-L189">189</span>
            <span class="line-number" id="file-tilemap-hx-L190" rel="file-tilemap-hx-L190">190</span>
            <span class="line-number" id="file-tilemap-hx-L191" rel="file-tilemap-hx-L191">191</span>
            <span class="line-number" id="file-tilemap-hx-L192" rel="file-tilemap-hx-L192">192</span>
            <span class="line-number" id="file-tilemap-hx-L193" rel="file-tilemap-hx-L193">193</span>
            <span class="line-number" id="file-tilemap-hx-L194" rel="file-tilemap-hx-L194">194</span>
            <span class="line-number" id="file-tilemap-hx-L195" rel="file-tilemap-hx-L195">195</span>
            <span class="line-number" id="file-tilemap-hx-L196" rel="file-tilemap-hx-L196">196</span>
            <span class="line-number" id="file-tilemap-hx-L197" rel="file-tilemap-hx-L197">197</span>
            <span class="line-number" id="file-tilemap-hx-L198" rel="file-tilemap-hx-L198">198</span>
            <span class="line-number" id="file-tilemap-hx-L199" rel="file-tilemap-hx-L199">199</span>
          </td>
          <td class="line-data">
            <pre class="line-pre"><div class="line" id="file-tilemap-hx-LC1"><span class="pl-st">import</span> <span class="pl-s3">haxe.xml.</span><span class="pl-s3">Fast</span>;
</div><div class="line" id="file-tilemap-hx-LC2"><span class="pl-st">import</span> <span class="pl-s3">flash.utils.</span><span class="pl-s3">ByteArray</span>;
</div><div class="line" id="file-tilemap-hx-LC3"><span class="pl-st">import</span> <span class="pl-s3">starling.display.</span><span class="pl-s3">Image</span>;
</div><div class="line" id="file-tilemap-hx-LC4"><span class="pl-st">import</span> <span class="pl-s3">starling.display.</span><span class="pl-s3">Sprite</span>;
</div><div class="line" id="file-tilemap-hx-LC5"><span class="pl-st">import</span> <span class="pl-s3">starling.utils.</span><span class="pl-s3">AssetManager</span>;
</div><div class="line" id="file-tilemap-hx-LC6">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC7"><span class="pl-st">enum</span> <span class="pl-en">Orientation</span> {
</div><div class="line" id="file-tilemap-hx-LC8">  <span class="pl-s3">Orthogonal</span>;
</div><div class="line" id="file-tilemap-hx-LC9">  <span class="pl-s3">Isometric</span>;
</div><div class="line" id="file-tilemap-hx-LC10">  <span class="pl-s3">IsometricStaggered</span>;
</div><div class="line" id="file-tilemap-hx-LC11">  <span class="pl-s3">HexagonalStaggered</span>;
</div><div class="line" id="file-tilemap-hx-LC12">}
</div><div class="line" id="file-tilemap-hx-LC13">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC14"><span class="pl-st">enum</span> <span class="pl-en">RenderOrder</span> {
</div><div class="line" id="file-tilemap-hx-LC15">  <span class="pl-s3">RightDown</span>;
</div><div class="line" id="file-tilemap-hx-LC16">  <span class="pl-s3">RightUp</span>;
</div><div class="line" id="file-tilemap-hx-LC17">  <span class="pl-s3">LeftDown</span>;
</div><div class="line" id="file-tilemap-hx-LC18">  <span class="pl-s3">LeftUp</span>;
</div><div class="line" id="file-tilemap-hx-LC19">}
</div><div class="line" id="file-tilemap-hx-LC20">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC21"><span class="pl-s">private</span> <span class="pl-st">class</span> <span class="pl-en">Tile</span> {
</div><div class="line" id="file-tilemap-hx-LC22">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">id</span>:<span class="pl-s3">Int</span>;
</div><div class="line" id="file-tilemap-hx-LC23">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">width</span>:<span class="pl-s3">Int</span>;
</div><div class="line" id="file-tilemap-hx-LC24">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">height</span>:<span class="pl-s3">Int</span>;
</div><div class="line" id="file-tilemap-hx-LC25">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">source</span>:<span class="pl-s3">String</span>;
</div><div class="line" id="file-tilemap-hx-LC26">  <span class="pl-c">// properties</span>
</div><div class="line" id="file-tilemap-hx-LC27">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC28">  <span class="pl-s">public</span> <span class="pl-st">function</span> <span class="pl-en">new</span>() {
</div><div class="line" id="file-tilemap-hx-LC29">  }
</div><div class="line" id="file-tilemap-hx-LC30">}
</div><div class="line" id="file-tilemap-hx-LC31">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC32"><span class="pl-s">private</span> <span class="pl-st">class</span> <span class="pl-en">Layer</span> {
</div><div class="line" id="file-tilemap-hx-LC33">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">name</span>:<span class="pl-s3">String</span>;
</div><div class="line" id="file-tilemap-hx-LC34">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">data</span>:<span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Tile</span><span class="pl-k">&gt;&gt;</span>;
</div><div class="line" id="file-tilemap-hx-LC35">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">visible</span>:<span class="pl-s3">Bool</span>;
</div><div class="line" id="file-tilemap-hx-LC36">  <span class="pl-c">// properties</span>
</div><div class="line" id="file-tilemap-hx-LC37">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC38">  <span class="pl-s">public</span> <span class="pl-st">function</span> <span class="pl-en">new</span>() {
</div><div class="line" id="file-tilemap-hx-LC39">    data <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Tile</span><span class="pl-k">&gt;&gt;</span>();
</div><div class="line" id="file-tilemap-hx-LC40">  }
</div><div class="line" id="file-tilemap-hx-LC41">}
</div><div class="line" id="file-tilemap-hx-LC42">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC43"><span class="pl-st">class</span> <span class="pl-en">Tilemap</span> <span class="pl-s">extends</span> <span class="pl-s3">Sprite</span> {
</div><div class="line" id="file-tilemap-hx-LC44">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC45">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">mapWidth</span>(<span class="pl-k">default</span>, <span class="pl-c1">null</span>):<span class="pl-s3">Int</span>;
</div><div class="line" id="file-tilemap-hx-LC46">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">mapHeight</span>(<span class="pl-k">default</span>, <span class="pl-c1">null</span>):<span class="pl-s3">Int</span>;
</div><div class="line" id="file-tilemap-hx-LC47">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">tileWidth</span>(<span class="pl-k">default</span>, <span class="pl-c1">null</span>):<span class="pl-s3">Int</span>;
</div><div class="line" id="file-tilemap-hx-LC48">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">tileHeight</span>(<span class="pl-k">default</span>, <span class="pl-c1">null</span>):<span class="pl-s3">Int</span>;
</div><div class="line" id="file-tilemap-hx-LC49">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">orientation</span>(<span class="pl-k">default</span>, <span class="pl-c1">null</span>):<span class="pl-s3">Orientation</span>;
</div><div class="line" id="file-tilemap-hx-LC50">  <span class="pl-s">public</span> <span class="pl-st">var</span> <span class="pl-en">renderOrder</span>(<span class="pl-k">default</span>, <span class="pl-c1">null</span>):<span class="pl-s3">RenderOrder</span>;
</div><div class="line" id="file-tilemap-hx-LC51">  <span class="pl-s">private</span> <span class="pl-st">var</span> <span class="pl-en">_tiles</span>:<span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Tile</span><span class="pl-k">&gt;</span>;
</div><div class="line" id="file-tilemap-hx-LC52">  <span class="pl-s">private</span> <span class="pl-st">var</span> <span class="pl-en">_layers</span>:<span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Layer</span><span class="pl-k">&gt;</span>;
</div><div class="line" id="file-tilemap-hx-LC53">  <span class="pl-s">private</span> <span class="pl-st">var</span> <span class="pl-en">_assets</span>:<span class="pl-s3">AssetManager</span>;
</div><div class="line" id="file-tilemap-hx-LC54">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC55">  <span class="pl-s">public</span> <span class="pl-st">function</span> <span class="pl-en">new</span>(assets:<span class="pl-s3">AssetManager</span>, xml:<span class="pl-s3">String</span>) {
</div><div class="line" id="file-tilemap-hx-LC56">    <span class="pl-v">super</span>();
</div><div class="line" id="file-tilemap-hx-LC57">    _assets <span class="pl-k">=</span> assets;
</div><div class="line" id="file-tilemap-hx-LC58">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC59">    <span class="pl-st">var</span> xml <span class="pl-k">=</span> <span class="pl-s3">Xml.</span>parse(<span class="pl-s3">haxe.</span><span class="pl-s3">Resource.</span>getString(xml));
</div><div class="line" id="file-tilemap-hx-LC60">    <span class="pl-st">var</span> source <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-s3">Fast</span>(xml.firstElement());
</div><div class="line" id="file-tilemap-hx-LC61">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC62">    <span class="pl-st">var</span> txt:<span class="pl-s3">String</span>;
</div><div class="line" id="file-tilemap-hx-LC63">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC64">    txt <span class="pl-k">=</span> source.att.orientation;
</div><div class="line" id="file-tilemap-hx-LC65">    <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC66">      orientation <span class="pl-k">=</span> <span class="pl-s3">Orientation.Orthogonal</span>;
</div><div class="line" id="file-tilemap-hx-LC67">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>orthogonal<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC68">      orientation <span class="pl-k">=</span> <span class="pl-s3">Orientation.Orthogonal</span>;
</div><div class="line" id="file-tilemap-hx-LC69">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>isometric<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC70">      orientation <span class="pl-k">=</span> <span class="pl-s3">Orientation.Isometric</span>;
</div><div class="line" id="file-tilemap-hx-LC71">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>isometric-staggered<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC72">      orientation <span class="pl-k">=</span> <span class="pl-s3">Orientation.IsometricStaggered</span>;
</div><div class="line" id="file-tilemap-hx-LC73">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>hexagonal-staggered<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC74">      orientation <span class="pl-k">=</span> <span class="pl-s3">Orientation.HexagonalStaggered</span>;
</div><div class="line" id="file-tilemap-hx-LC75">    }
</div><div class="line" id="file-tilemap-hx-LC76">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC77">    txt <span class="pl-k">=</span> source.att.renderorder;
</div><div class="line" id="file-tilemap-hx-LC78">    <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC79">      renderOrder <span class="pl-k">=</span> <span class="pl-s3">RenderOrder.RightDown</span>;
</div><div class="line" id="file-tilemap-hx-LC80">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>right-down<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC81">      renderOrder <span class="pl-k">=</span> <span class="pl-s3">RenderOrder.RightDown</span>;
</div><div class="line" id="file-tilemap-hx-LC82">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>right-up<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC83">      renderOrder <span class="pl-k">=</span> <span class="pl-s3">RenderOrder.RightUp</span>;
</div><div class="line" id="file-tilemap-hx-LC84">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>left-down<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC85">      renderOrder <span class="pl-k">=</span> <span class="pl-s3">RenderOrder.LeftDown</span>;
</div><div class="line" id="file-tilemap-hx-LC86">    } <span class="pl-k">else</span> <span class="pl-k">if</span> (txt <span class="pl-k">==</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>left-up<span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC87">      renderOrder <span class="pl-k">=</span> <span class="pl-s3">RenderOrder.LeftUp</span>;
</div><div class="line" id="file-tilemap-hx-LC88">    }
</div><div class="line" id="file-tilemap-hx-LC89">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC90">    mapWidth <span class="pl-k">=</span> <span class="pl-s3">Std.</span>parseInt(source.att.width);
</div><div class="line" id="file-tilemap-hx-LC91">    mapHeight <span class="pl-k">=</span> <span class="pl-s3">Std.</span>parseInt(source.att.height);
</div><div class="line" id="file-tilemap-hx-LC92">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC93">    tileWidth <span class="pl-k">=</span> <span class="pl-s3">Std.</span>parseInt(source.att.tilewidth);
</div><div class="line" id="file-tilemap-hx-LC94">    tileHeight <span class="pl-k">=</span> <span class="pl-s3">Std.</span>parseInt(source.att.tileheight);
</div><div class="line" id="file-tilemap-hx-LC95">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC96">    _tiles <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Tile</span><span class="pl-k">&gt;</span>();
</div><div class="line" id="file-tilemap-hx-LC97">    <span class="pl-k">for</span> (tileset in source.nodes.tileset) {
</div><div class="line" id="file-tilemap-hx-LC98">      <span class="pl-k">if</span> (tileset.has.source) {
</div><div class="line" id="file-tilemap-hx-LC99">        <span class="pl-k">throw</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>External tileset source not supported.<span class="pl-pds">&quot;</span></span>;
</div><div class="line" id="file-tilemap-hx-LC100">      }
</div><div class="line" id="file-tilemap-hx-LC101">      <span class="pl-k">if</span> (tileset.has.margin <span class="pl-k">||</span> tileset.has.spacing) {
</div><div class="line" id="file-tilemap-hx-LC102">        <span class="pl-k">throw</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Only image collections are supported.<span class="pl-pds">&quot;</span></span>;
</div><div class="line" id="file-tilemap-hx-LC103">      }
</div><div class="line" id="file-tilemap-hx-LC104">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC105">      <span class="pl-k">for</span> (tile in tileset.nodes.tile) {
</div><div class="line" id="file-tilemap-hx-LC106">        <span class="pl-k">if</span> (tile.has.id) {
</div><div class="line" id="file-tilemap-hx-LC107">          <span class="pl-st">var</span> t <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-s3">Tile</span>();
</div><div class="line" id="file-tilemap-hx-LC108">          t.id <span class="pl-k">=</span> <span class="pl-s3">Std.</span>parseInt(tile.att.id);
</div><div class="line" id="file-tilemap-hx-LC109">          <span class="pl-k">for</span> (image in tile.nodes.image) {
</div><div class="line" id="file-tilemap-hx-LC110">            t.width <span class="pl-k">=</span> <span class="pl-s3">Std.</span>parseInt(image.att.width);
</div><div class="line" id="file-tilemap-hx-LC111">            t.height <span class="pl-k">=</span> <span class="pl-s3">Std.</span>parseInt(image.att.height);
</div><div class="line" id="file-tilemap-hx-LC112">            t.source <span class="pl-k">=</span> image.att.source;
</div><div class="line" id="file-tilemap-hx-LC113">            t.source <span class="pl-k">=</span> t.source.substr(<span class="pl-c1">0</span>, t.source.length<span class="pl-k">-</span><span class="pl-c1">4</span>);
</div><div class="line" id="file-tilemap-hx-LC114">          }
</div><div class="line" id="file-tilemap-hx-LC115">          _tiles.push(t);
</div><div class="line" id="file-tilemap-hx-LC116">        }
</div><div class="line" id="file-tilemap-hx-LC117">      }
</div><div class="line" id="file-tilemap-hx-LC118">    }
</div><div class="line" id="file-tilemap-hx-LC119">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC120">    _layers <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Layer</span><span class="pl-k">&gt;</span>();
</div><div class="line" id="file-tilemap-hx-LC121">    <span class="pl-k">for</span> (layer in source.nodes.layer) {
</div><div class="line" id="file-tilemap-hx-LC122">      <span class="pl-st">var</span> t <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-s3">Layer</span>();
</div><div class="line" id="file-tilemap-hx-LC123">      t.name <span class="pl-k">=</span> layer.att.name;
</div><div class="line" id="file-tilemap-hx-LC124">      <span class="pl-k">for</span> (i in <span class="pl-c1">0</span><span class="pl-k">...</span>mapHeight) {
</div><div class="line" id="file-tilemap-hx-LC125">        t.data.push(<span class="pl-k">new</span> <span class="pl-s3">Array</span><span class="pl-k">&lt;</span><span class="pl-s3">Tile</span><span class="pl-k">&gt;</span>());
</div><div class="line" id="file-tilemap-hx-LC126">        <span class="pl-k">for</span> (j in <span class="pl-c1">0</span><span class="pl-k">...</span>mapWidth) {
</div><div class="line" id="file-tilemap-hx-LC127">          t.data[i].push(<span class="pl-c1">null</span>);
</div><div class="line" id="file-tilemap-hx-LC128">        }
</div><div class="line" id="file-tilemap-hx-LC129">      }
</div><div class="line" id="file-tilemap-hx-LC130">      <span class="pl-st">var</span> i <span class="pl-k">=</span> <span class="pl-c1">0</span>;
</div><div class="line" id="file-tilemap-hx-LC131">      <span class="pl-k">for</span> (data in layer.nodes.data) {
</div><div class="line" id="file-tilemap-hx-LC132">        <span class="pl-k">for</span> (tile in data.nodes.tile) {
</div><div class="line" id="file-tilemap-hx-LC133">          t.data[<span class="pl-s3">Std.</span>int(i <span class="pl-k">/</span> mapWidth)][<span class="pl-s3">Std.</span>int(i <span class="pl-k">%</span> mapWidth)] <span class="pl-k">=</span> _tiles[<span class="pl-s3">Std.</span>parseInt(tile.att.gid)<span class="pl-k">-</span><span class="pl-c1">1</span>];
</div><div class="line" id="file-tilemap-hx-LC134">          i <span class="pl-k">+</span><span class="pl-k">=</span> <span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC135">        }
</div><div class="line" id="file-tilemap-hx-LC136">      }
</div><div class="line" id="file-tilemap-hx-LC137">      _layers.push(t);
</div><div class="line" id="file-tilemap-hx-LC138">    }
</div><div class="line" id="file-tilemap-hx-LC139">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC140">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC141">    <span class="pl-k">for</span> (layer in _layers) {
</div><div class="line" id="file-tilemap-hx-LC142">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC143">      <span class="pl-c">// The default is renderOrder == RenderOrder.RightDown</span>
</div><div class="line" id="file-tilemap-hx-LC144">      <span class="pl-st">var</span> xi <span class="pl-k">=</span> <span class="pl-c1">0</span>;
</div><div class="line" id="file-tilemap-hx-LC145">      <span class="pl-st">var</span> xf <span class="pl-k">=</span> mapWidth;
</div><div class="line" id="file-tilemap-hx-LC146">      <span class="pl-st">var</span> dx <span class="pl-k">=</span> <span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC147">      <span class="pl-st">var</span> yi <span class="pl-k">=</span> <span class="pl-c1">0</span>;
</div><div class="line" id="file-tilemap-hx-LC148">      <span class="pl-st">var</span> yf <span class="pl-k">=</span> mapHeight;
</div><div class="line" id="file-tilemap-hx-LC149">      <span class="pl-st">var</span> dy <span class="pl-k">=</span> <span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC150">      
</div><div class="line" id="file-tilemap-hx-LC151">      <span class="pl-k">if</span> (renderOrder <span class="pl-k">==</span> <span class="pl-s3">RenderOrder.RightUp</span>) {
</div><div class="line" id="file-tilemap-hx-LC152">        xi <span class="pl-k">=</span> <span class="pl-c1">0</span>;
</div><div class="line" id="file-tilemap-hx-LC153">        xf <span class="pl-k">=</span> mapWidth;
</div><div class="line" id="file-tilemap-hx-LC154">        dx <span class="pl-k">=</span> <span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC155">        yi <span class="pl-k">=</span> mapHeight<span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC156">        yf <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC157">        dy <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC158">      }
</div><div class="line" id="file-tilemap-hx-LC159">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC160">      <span class="pl-k">if</span> (renderOrder <span class="pl-k">==</span> <span class="pl-s3">RenderOrder.LeftDown</span>) {
</div><div class="line" id="file-tilemap-hx-LC161">        xi <span class="pl-k">=</span> mapWidth<span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC162">        xf <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC163">        dx <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC164">        yi <span class="pl-k">=</span> <span class="pl-c1">0</span>;
</div><div class="line" id="file-tilemap-hx-LC165">        yf <span class="pl-k">=</span> mapHeight;
</div><div class="line" id="file-tilemap-hx-LC166">        dy <span class="pl-k">=</span> <span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC167">      }
</div><div class="line" id="file-tilemap-hx-LC168">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC169">      <span class="pl-k">if</span> (renderOrder <span class="pl-k">==</span> <span class="pl-s3">RenderOrder.LeftUp</span>) {
</div><div class="line" id="file-tilemap-hx-LC170">        xi <span class="pl-k">=</span> mapWidth<span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC171">        xf <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC172">        dx <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC173">        yi <span class="pl-k">=</span> mapHeight<span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC174">        yf <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC175">        dy <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>;
</div><div class="line" id="file-tilemap-hx-LC176">      }
</div><div class="line" id="file-tilemap-hx-LC177">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC178">      <span class="pl-st">var</span> _x <span class="pl-k">=</span> <span class="pl-c1">0</span>;
</div><div class="line" id="file-tilemap-hx-LC179">      <span class="pl-st">var</span> _y <span class="pl-k">=</span> <span class="pl-c1">0</span>;
</div><div class="line" id="file-tilemap-hx-LC180">      <span class="pl-k">while</span> (_y <span class="pl-k">!</span><span class="pl-k">=</span> yf) {
</div><div class="line" id="file-tilemap-hx-LC181">        <span class="pl-k">while</span> (_x <span class="pl-k">!</span><span class="pl-k">=</span> xf) {
</div><div class="line" id="file-tilemap-hx-LC182">          <span class="pl-st">var</span> cell <span class="pl-k">=</span> layer.data[_y][_x];
</div><div class="line" id="file-tilemap-hx-LC183">          <span class="pl-k">if</span> (cell <span class="pl-k">!</span><span class="pl-k">=</span> <span class="pl-c1">null</span> <span class="pl-k">&amp;&amp;</span> cell.source <span class="pl-k">!</span><span class="pl-k">=</span> <span class="pl-c1">null</span> <span class="pl-k">&amp;&amp;</span> cell.source <span class="pl-k">!</span><span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>) {
</div><div class="line" id="file-tilemap-hx-LC184">            <span class="pl-st">var</span> img <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-s3">Image</span>(_assets.getTexture(cell.source));
</div><div class="line" id="file-tilemap-hx-LC185">            img.pivotY <span class="pl-k">=</span> img.height;
</div><div class="line" id="file-tilemap-hx-LC186">            img.x <span class="pl-k">=</span> _x<span class="pl-k">*</span>tileWidth;
</div><div class="line" id="file-tilemap-hx-LC187">            img.y <span class="pl-k">=</span> _y<span class="pl-k">*</span>tileHeight <span class="pl-k">+</span> <span class="pl-c1">32</span>;
</div><div class="line" id="file-tilemap-hx-LC188">            addChild(img);
</div><div class="line" id="file-tilemap-hx-LC189">          }
</div><div class="line" id="file-tilemap-hx-LC190">          _x <span class="pl-k">+</span><span class="pl-k">=</span> dy;
</div><div class="line" id="file-tilemap-hx-LC191">        }
</div><div class="line" id="file-tilemap-hx-LC192">        _x <span class="pl-k">=</span> xi;
</div><div class="line" id="file-tilemap-hx-LC193">        _y <span class="pl-k">+</span><span class="pl-k">=</span> dy;
</div><div class="line" id="file-tilemap-hx-LC194">      }
</div><div class="line" id="file-tilemap-hx-LC195">    }
</div><div class="line" id="file-tilemap-hx-LC196">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC197">  }
</div><div class="line" id="file-tilemap-hx-LC198">&nbsp;
</div><div class="line" id="file-tilemap-hx-LC199">}
</div></pre>
          </td>
        </tr>
      </table>
    </div>

  </div>
</div>


        <div class="discussion-timeline js-quote-selection-container">

          <div class="js-discussion">
            
          </div>

          <div class="discussion-timeline-actions">
              <div class="timeline-comment-wrapper timeline-new-comment js-comment-container">
  <a href="/breadraptor"><img class="timeline-comment-avatar" src="https://avatars1.githubusercontent.com/u/6947714?s=140" width="48" height="48"></a>

  <form accept-charset="UTF-8" action="/jdpalmer/ad30293d0bcc3f0706c5/comments" class="js-new-comment-form js-comment-form" method="post"><div style="display:none"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="H701koF8TTU9fxThL4SLLAEO4aUIvGV8Ru429y7PTLYOn9pgBwikLyVHFCHyphrzkT5yoOukRw8HIsvqRUphdQ==" /></div>
    <div class="timeline-comment">
      <input type="hidden" name="gist" value="20255843" />

      <div id="js-new-comment-form-actions">
        
<div class="js-previewable-comment-form previewable-comment-form write-selected" data-preview-url="/preview">
  <div class="comment-form-head tabnav">
    <ul class="tabnav-tabs">
      <li><a href="#comment_body_246_write_bucket" class="tabnav-tab write-tab js-write-tab selected" data-skip-pjax>Write</a></li>
      <li><a href="#comment_body_246_preview_bucket" class="tabnav-tab preview-tab js-preview-tab" data-skip-pjax>Preview</a></li>
    </ul>
    <span class="tabnav-right">
      <a class="tabnav-widget text tabnav-extras" href="https://help.github.com/articles/github-flavored-markdown" target="_blank">
        <span class="octicon octicon-markdown"></span>
        Parsed as Markdown
      </a>
      
<a href="#fullscreen_comment_body_246" class="enable-fullscreen js-enable-fullscreen tooltipped-n
  tabnav-widget text tabnav-extras"  >
  <span class="octicon octicon-screen-full"></span>
  Edit in fullscreen
</a>


    </span>
  </div>


  <div id="comment_body_246_write_bucket" class="write-content js-write-bucket ">
    <textarea name="comment[body]"
              tabindex="1"
              id="comment_body_246"
              placeholder="Leave a comment"
              class="comment-form-textarea js-comment-field js-size-to-fit js-quote-selection-target input-with-fullscreen-icon"
              data-suggester="comment_body_246_suggestions"
              required></textarea>

    

  </div>
  <div id="comment_body_246_preview_bucket" class="preview-content js-preview-bucket">
    <div class="comment-body markdown-body  js-comment-body">
    </div>
  </div>


  <div class="suggester-container">
    <div class="suggester js-navigation-container" id="comment_body_246_suggestions"
         data-url="/jdpalmer/ad30293d0bcc3f0706c5/suggestions">
    </div>
  </div>
</div>

        <div class="form-actions">
          <button type="submit" class="button primary js-comment-submit" tabindex="2" data-disable-with data-disable-invalid>
            Comment
          </button>
        </div>
      </div>
    </div>
</form></div>
  

          </div>
        </div><!-- /.discussion-timeline -->
      </div><!-- /.gist-content -->
    </div>
  </div>
</div><!-- /.container -->

  <div class="context-overlay"></div>
</div>

    </div>
    <div class="slow-loading-overlay"></div>
  </div>

  <div id="ajax-error-message" class="flash flash-error">
    <div class="container">
      <span class="octicon octicon-alert"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="octicon octicon-x ajax-error-dismiss"></a>
    </div>
  </div>


  <footer>
    <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="https://github.com/blog">Blog</a></li>
      <li><a href="https://github.com/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github" title="GitHub "></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.02381s from github-fe102-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy">Privacy</a></li>
        <li><a href="https://github.com/security">Security</a></li>
        <li><a href="https://github.com/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->

  </footer>

  <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
        <div class="suggester-container">
            <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                data-url="/jdpalmer/ad30293d0bcc3f0706c5/suggestions">
            </div>
        </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>


</body>
</html>
