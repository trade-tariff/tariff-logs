# cloudfoundry-newrelic-logs

Logstash config to forward CloudFoundry logs to NewRelic

## Getting started

1. Install docker
2. You'll also need a cf user and the cf cli installed (use `asdf plugin add cf; asdf install`)

## Updating and deploying a new tariff-logs image

The process for updating tariff logs image is:

1. Make a change to the Dockerfile or the logstash config files.
2. Build and tag the image locally
3. Login to the docker hub organisation account (currently williammichaelfish - though this should change soon)
4. Push the image to docker hub
5. Push the manifest to cloudfoundry

```bash
docker build -t 'williammichaelfish/tariff-logs:7.16.2' .
docker login
docker push williammichaelfish/tariff-logs:7.16.2
cf create-app-manifest tariff-logs
cf push tariff-logs -f tariff-logs_manifest.yml --docker-image williammichaelfish/tariff-logs:7.16.2
```
