// CodeMirror, copyright (c) by Marijn Haverbeke and others
// Distributed under an MIT license: http://codemirror.net/LICENSE

(function(mod) {
  if (typeof exports == "object" && typeof module == "object") // CommonJS
    mod(require("../../lib/codemirror"));
  else if (typeof define == "function" && define.amd) // AMD
    define(["../../lib/codemirror"], mod);
  else // Plain browser env
    mod(CodeMirror);
})(function(CodeMirror) {
  "use strict";

  var WORD = /[\w$]+/, RANGE = 500;
  var glist=["addcontentsline{file}{sec_unit}{entry}","addtocontents{file}{text}","addtocounter{counter}{value}","address{Return address}","addtolength{len-cmd}{len}","addvspace","alph","appendix","arabic","author","backslash","baselineskip","baselinestretch","bfseries","bibitem","bigskipamount","bigskip","boldmath","boldsymbol","cal","caption","cdots","centering","chapter","circle","cite","cleardoublepage","clearpage","cline","closing","color","copyright","dashbox","date","ddots","documentclass[options]{style}","dotfill","em","emph","ensuremath (LaTeX2e)","epigraph","euro","fbox","flushbottom","fnsymbol","footnote","footnotemark","footnotesize","footnotetext","frac","frame","framebox","frenchspacing","hfill","hline","href","hrulefill","hspace","huge","Huge","hyphenation{word list}","include","includegraphics","includeonly","indent","input","itshape","item","kill","label","large","Large","LARGE","LaTeX","LaTeXe","ldots","left","lefteqn","line","linebreak","linethickness","linewidth","listoffigures","listoftables","location","makebox","maketitle","markboth","markright","mathcal","mathop","mbox","medskip","multicolumn","multiput","newcommand","newcolumntype","newcounter","newenvironment","newfont","newlength","newline","newpage","newsavebox","newtheorem","nocite","noindent","nolinebreak","nonfrenchspacing","normalsize","nopagebreak","not","onecolumn","opening","oval","overbrace","overline","pagebreak","pagenumbering","pageref","pagestyle","par","paragraph","parbox","parindent","parskip","part","protect","providecommand (LaTeX2e)","put","quad","qquad","raggedbottom","raggedleft","raggedright","raisebox","ref","renewcommand","right","rmfamily","roman","rule","savebox","sbox","scshape","scriptsize","section","setcounter","setlength","settowidth","sffamily","shortstack","signature","slshape","slash","small","smallskip","sout","space","sqrt","stackrel","stepcounter","subparagraph","subsection","subsubsection","tableofcontents","telephone","TeX","textbf{}","textcolor{}{}","textit{}","textmd{}","textnormal{}","textrm{}","textsc{}","textsf{}","textsl{}","texttt{}","textup{}","textwidth","textheight","thanks","thispagestyle","tiny","title","today","ttfamily","twocolumn","typeout","typein","uline","underbrace","underline","unitlength","usebox","usecounter","usepackage","uwave","value","vbox{text}","vcenter","vdots","vector","verb","vfill","vline","vphantom","vspace"];

  CodeMirror.registerHelper("hint", "anyword", function(editor, options) {
    var word = options && options.word || WORD;
    var range = options && options.range || RANGE;
    var cur = editor.getCursor(), curLine = editor.getLine(cur.line);
    var end = cur.ch, start = end;
    while (start && word.test(curLine.charAt(start - 1))) --start;
    var curWord = start != end && curLine.slice(start, end);

    /*var list = options && options.list || [], seen = {};
    var re = new RegExp(word.source, "g");
    for (var dir = -1; dir <= 1; dir += 2) {
      var line = cur.line, endLine = Math.min(Math.max(line + dir * range, editor.firstLine()), editor.lastLine()) + dir;
      for (; line != endLine; line += dir) {
        var text = editor.getLine(line), m;
        while (m = re.exec(text)) {
          if (line == cur.line && m[0] === curWord) continue;
          if ((!curWord || m[0].lastIndexOf(curWord, 0) == 0) && !Object.prototype.hasOwnProperty.call(seen, m[0])) {
            seen[m[0]] = true;
            list.push(m[0]);
          }
        }
      }
    }*/
	var list=[];
	//console.log(curWord);
	//console.log(list);
	//curWord=(curWord || '').toLowerCase();
	for(var i = 0; i < glist.length; i++){    
		if(!curWord || glist[i].indexOf(curWord)==0){
			list.push(glist[i]);
		}
	}
    return {list: list, from: CodeMirror.Pos(cur.line, start), to: CodeMirror.Pos(cur.line, end)};
  });
});
