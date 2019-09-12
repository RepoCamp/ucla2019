
## Team B Blue Star
- Youn Noh
- Jen Diamond
- Terry Brady

+++?image=app/assets/images/bluestar_logo.png

+++

## Add travis ci test

Run rspec spec in docker each time a pull request is made or updated.

+++?image=docs/travis.gif

+++
## Steps required
- Mark turned on travis ci for the repo (as the GitHub org administrator)
- create .travis.yml file

+++?code=.travis.yml&lang=yaml
@[16-20](install docker-compose)
@[22-24](Start Hyrax in Docker)
@[30-32](Run rspec in Docker)
@[34-35](Stop Hyrax in Docker)

+++

## Create an image CSV importer

+++

## View imported images with IIIF viewer

- [Overview Documentation](https://github.com/samvera/hyrax/wiki/Hyrax-Management-Guide#option-1-built-in-riiif-image-server)
- [Troubleshooting Guide](https://samvera.github.io/troubleshooting_riiif.html)

+++?code=config/initializers/hyrax.rb
@[140](enable IIIF)

+++?image=docs/iiif.gif
