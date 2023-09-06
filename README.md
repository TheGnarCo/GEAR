# ⚙️ G.E.A.R. ⚙️

## The _Gnar Employee Asset Repository_

### a GNIP WIP

## Getting Started

1. Acquire the `config/master.key` file from a trusted associate.
1. `bin/setup`
1. `bin/dev`

## Secrets

GEAR embraces the [Rails 7 Credentials System](https://edgeguides.rubyonrails.org/security.html#custom-credentials).

Once you have the `config/master.key`, you can run `bin/rails credentials:edit` to view and change the rails secrets.

(As a reminder: This will change the `credentials.enc.yml` file, which is checked into git.)

## Hosting

GEAR is automatically deployed as a result of successful checks running on `MAIN` following a merge.

GEAR is currently hosted on `heroku`, and a live version (on the free tier - sorry for slow loads!) can be found [here](https://gnar-gear.herokuapp.com/)!

## Troubleshooting

> Whoa, the site looks unstyled when I run it locally!

We previously precompiled the assets for reasons that no longer exist. Check your `/public` directory for an  `/assets` directory, and then delete it.

## About The Gnar Company

![The Gnar Company](https://avatars0.githubusercontent.com/u/17011419?s=100&v=4)

If you’re ready to dream it, we’re ready to build it. The Gnar is a custom software company ready to tackle your biggest challenges. Visit [The Gnar Company website](https://www.thegnar.com/) to learn more about us or [contact us](https://www.thegnar.com/contact) to see how we can help design and develop your product.
