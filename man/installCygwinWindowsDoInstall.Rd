% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{installCygwinWindowsDoInstall}
\alias{installCygwinWindowsDoInstall}
\title{Install necessary helper apps (Windows only)}
\usage{
installCygwinWindowsDoInstall(force = FALSE, proxy = Sys.getenv("https_proxy"))
}
\arguments{
\item{force}{Set to \code{TRUE} to update a Cygwin environment that
was previously installed with the function, or to overwrite any existing
installation in \code{c:\\cygwin}}

\item{proxy}{Specify any proxy to be used for downloading via http, e.g.
`host_or_ip:port`; defaults to the environment variable `https_proxy`.
Set to `""` to not specify or to unset a proxy.}
}
\description{
Convenience function to install a minimal Cygwin environment under MS
Windows, including perl, sed and php.
Alternatively and in case of difficulties, download and run the cygwin
setup yourself as follows: \code{cygwinsetup.exe --no-admin --quiet-mode
--verbose --upgrade-also --root c:/cygwin --site
https://www.mirrorservice.org/sites/sourceware.org/pub/cygwin/ --packages
perl,php-jsonc,php-simplexml}.
These binaries are required only for function \link{ctrLoadQueryIntoDb}
when used for register "EUCTR", "CTGOV" or "ISRCT",
but not for any other register or any other function in this package.
}
\examples{
\dontrun{


try(installCygwinWindowsDoInstall(), silent = TRUE)

}
}
