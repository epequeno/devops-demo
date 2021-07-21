# devops-demo
demo stuff

# security

This demo attempts to balance simplicity/brevity with security considerations.
While more could be done towards getting the CVE count for the image to zero, 
this example still attempts to incorporate some security best practices.

Here are the results of the `Anchore` scan against the image defined within this repo:

```
$ anchore-cli image list
Full Tag                                  Image Digest                                                                   Analysis Status        
docker.io/epequeno/litecoin:0.18.1        sha256:15c66ee8a767cf518e8f081c2bac7accd0669ed330c511aa91a689340c21d6bb        analyzed               


$ anchore-cli image vuln epequeno/litecoin:0.18.1 all
Vulnerability ID        Package                              Severity          Fix         CVE Refs                Vulnerability URL                                                     Type        Feed Group          Package Path        
CVE-2013-4235           login-1:4.8.1-1ubuntu5.20.04         Low               None        CVE-2013-4235           http://people.ubuntu.com/~ubuntu-security/cve/CVE-2013-4235           dpkg        ubuntu:20.04        pkgdb               
CVE-2013-4235           passwd-1:4.8.1-1ubuntu5.20.04        Low               None        CVE-2013-4235           http://people.ubuntu.com/~ubuntu-security/cve/CVE-2013-4235           dpkg        ubuntu:20.04        pkgdb               
CVE-2016-2781           coreutils-8.30-3ubuntu2              Low               None        CVE-2016-2781           http://people.ubuntu.com/~ubuntu-security/cve/CVE-2016-2781           dpkg        ubuntu:20.04        pkgdb               
CVE-2019-18276          bash-5.0-6ubuntu1.1                  Low               None        CVE-2019-18276          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2019-18276          dpkg        ubuntu:20.04        pkgdb               
CVE-2019-20838          libpcre3-2:8.39-12build1             Low               None        CVE-2019-20838          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2019-20838          dpkg        ubuntu:20.04        pkgdb               
CVE-2019-25013          libc-bin-2.31-0ubuntu9.2             Low               None        CVE-2019-25013          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2019-25013          dpkg        ubuntu:20.04        pkgdb               
CVE-2019-25013          libc6-2.31-0ubuntu9.2                Low               None        CVE-2019-25013          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2019-25013          dpkg        ubuntu:20.04        pkgdb               
CVE-2020-13529          libsystemd0-245.4-4ubuntu3.7         Low               None        CVE-2020-13529          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-13529          dpkg        ubuntu:20.04        pkgdb               
CVE-2020-13529          libudev1-245.4-4ubuntu3.7            Low               None        CVE-2020-13529          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-13529          dpkg        ubuntu:20.04        pkgdb               
CVE-2020-27618          libc-bin-2.31-0ubuntu9.2             Low               None        CVE-2020-27618          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-27618          dpkg        ubuntu:20.04        pkgdb               
CVE-2020-27618          libc6-2.31-0ubuntu9.2                Low               None        CVE-2020-27618          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-27618          dpkg        ubuntu:20.04        pkgdb               
CVE-2020-29562          libc-bin-2.31-0ubuntu9.2             Low               None        CVE-2020-29562          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-29562          dpkg        ubuntu:20.04        pkgdb               
CVE-2020-29562          libc6-2.31-0ubuntu9.2                Low               None        CVE-2020-29562          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-29562          dpkg        ubuntu:20.04        pkgdb               
CVE-2020-6096           libc-bin-2.31-0ubuntu9.2             Low               None        CVE-2020-6096           http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-6096           dpkg        ubuntu:20.04        pkgdb               
CVE-2020-6096           libc6-2.31-0ubuntu9.2                Low               None        CVE-2020-6096           http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-6096           dpkg        ubuntu:20.04        pkgdb               
CVE-2021-20231          libgnutls30-3.6.13-2ubuntu1.3        Low               None        CVE-2021-20231          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-20231          dpkg        ubuntu:20.04        pkgdb               
CVE-2021-20232          libgnutls30-3.6.13-2ubuntu1.3        Low               None        CVE-2021-20232          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-20232          dpkg        ubuntu:20.04        pkgdb               
CVE-2021-27645          libc-bin-2.31-0ubuntu9.2             Low               None        CVE-2021-27645          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-27645          dpkg        ubuntu:20.04        pkgdb               
CVE-2021-27645          libc6-2.31-0ubuntu9.2                Low               None        CVE-2021-27645          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-27645          dpkg        ubuntu:20.04        pkgdb               
CVE-2021-3326           libc-bin-2.31-0ubuntu9.2             Low               None        CVE-2021-3326           http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-3326           dpkg        ubuntu:20.04        pkgdb               
CVE-2021-3326           libc6-2.31-0ubuntu9.2                Low               None        CVE-2021-3326           http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-3326           dpkg        ubuntu:20.04        pkgdb               
CVE-2021-33560          libgcrypt20-1.8.5-5ubuntu1           Low               None        CVE-2021-33560          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-33560          dpkg        ubuntu:20.04        pkgdb               
CVE-2021-31879          wget-1.20.3-1ubuntu1                 Medium            None        CVE-2021-31879          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-31879          dpkg        ubuntu:20.04        pkgdb               
CVE-2016-10228          libc-bin-2.31-0ubuntu9.2             Negligible        None        CVE-2016-10228          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2016-10228          dpkg        ubuntu:20.04        pkgdb               
CVE-2016-10228          libc6-2.31-0ubuntu9.2                Negligible        None        CVE-2016-10228          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2016-10228          dpkg        ubuntu:20.04        pkgdb               
CVE-2017-11164          libpcre3-2:8.39-12build1             Negligible        None        CVE-2017-11164          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2017-11164          dpkg        ubuntu:20.04        pkgdb               
CVE-2018-1000654        libtasn1-6-4.16.0-2                  Negligible        None        CVE-2018-1000654        http://people.ubuntu.com/~ubuntu-security/cve/CVE-2018-1000654        dpkg        ubuntu:20.04        pkgdb               
CVE-2020-14155          libpcre3-2:8.39-12build1             Negligible        None        CVE-2020-14155          http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-14155          dpkg        ubuntu:20.04        pkgdb               

```