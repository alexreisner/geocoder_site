# WorldsFastestAnimal.com

This is a static site generated by Middleman.

To run locally:

    bundle exec middleman server

## Deply To S3

    bundle exec middleman build
    s3cmd sync -P build/* s3://www.rubygeocoder.com/

When changes are made, CloudFront endpoints need to be invalidated (if configured).
