--[==========================================[--
          L3BUILD FILE FOR ELEGANTPAPER
     Check PDF File & Directory After Build
--]==========================================]--

--[==========================================[--
                Basic Information
             Do Check Before Upload
--]==========================================]--
module           = "elegantpaper"
version          = "0.12"
maintainer       = "Ran Wang"
uploader         = maintainer
maintainid       = "ElegantLaTeX"
email            = "ranwang.osbert@outlook.com"
repository       = "https://github.com/" .. maintainid .. "/" .. module
announcement     = ""
note             = ""
summary          = "An Elegant LaTeX Template for Working Papers"
description      = [[ElegantPaper is designed for writing working papers, especially for economics students. This template is based on the standard LaTeX article class. The goal of this template is to make the writing process easier and more comfortable.]]

--[==========================================[--
         Build, Pack and Upload To CTAN
         Do not Modify Unless Necessary
--]==========================================]--
ctanzip          = module
excludefiles     = {"*~"}
textfiles        = {"*.md", "LICENSE", "*.lua", "*.cls", "*.bib"}
typesetexe       = "latexmk -pdf"
typesetfiles     = {module .. "-cn.tex", module .. "-en.tex"}
typesetopts      = "-interaction=nonstopmode"
typesetruns      = 1
typesetsuppfiles = {"*.cls", "*.bib"}
imagesuppdir     = "image"
specialtypesetting = specialtypesetting or {}
specialtypesetting[module .. "-cn.tex"] = {cmd = "latexmk -xelatex"}

uploadconfig = {
  pkg          = module,
  version      = version,
  author       = maintainer,
  uploader     = uploader,
  email        = email,
  summary      = summary,
  description  = description,
  announcement = announcement,
  note         = note,
  license      = "lppl1.3c",
  ctanPath     = "/macros/latex/contrib/" .. module .. "/",
  home         = repository,
  support      = repository .. "/issues",
  bugtracker   = repository .. "/issues",
  repository   = repository,
  development  = "https://github.com/" .. maintainid,
  update       = true
}

function tex(file, dir, cmd)
  dir = dir or "."
  cmd = cmd or typesetexe .. " " .. typesetopts
  return run(dir, cmd .. " " .. file)
end

-- Copy required files into the typeset build dir
function docinit_hook()
  -- Copy .cls, .bib support files
  for _, glob in pairs(typesetsuppfiles) do
    cp(glob, currentdir, typesetdir)
  end
  -- Copy image subdirectory
  local dest = typesetdir .. "/" .. imagesuppdir
  mkdir(dest)
  cp("*", imagesuppdir, dest)
  -- Copy tex source files
  for _, texfile in pairs(typesetfiles) do
    cp(texfile, currentdir, typesetdir)
  end
  return 0
end

-- Pack CTAN directory
function copyctan()
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)
  for _, glob in pairs(typesetsuppfiles) do
    cp(glob, currentdir, pkgdir)
  end
  for _, texfile in pairs(typesetfiles) do
    cp(texfile, currentdir, pkgdir)
  end
  for _, glob in pairs(pdffiles or {"*.pdf"}) do
    cp(glob, typesetdir, pkgdir)
  end
  local dest = pkgdir .. "/" .. imagesuppdir
  mkdir(dest)
  cp("*", imagesuppdir, dest)
end
