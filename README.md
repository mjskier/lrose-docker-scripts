# docker_scripts
Various scripts and files to build a lrose-blaze image

  * Dockerfile
      Used by the build.sh script
  * build.sh
      create a VERSION file with today's date
      build lrose-blaze from the top of NCAR/lrose-core
  * release.sh
      Tag the image and push it so that it is available as 'latest' as well as 'mmddyyyy'