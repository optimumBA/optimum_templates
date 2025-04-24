# Optimum Templates

Phoenix generator templates customized to enforce Credo rules.

## Usage

Add the repo as a git submodule to your Phoenix app.

```bash
git submodule add https://github.com/optimumBA/optimum_templates priv/templates
```

Then run a generator, e.g.

```bash
mix phx.gen.context Accounts User users name:string age:integer
```
