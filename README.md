# Optimum Templates

Phoenix generator templates customized to enforce Credo rules.

Targets **Phoenix 1.8.x** (tested against 1.8.7).

## Usage

Add the repo as a git submodule to your Phoenix app (use `--recurse-submodules` when cloning projects that already include this submodule):

```bash
git submodule add https://github.com/optimumBA/optimum_templates priv/templates
```

When cloning a project that already has this submodule:

```bash
git clone --recurse-submodules <repo-url>
```

Then run a generator, e.g.

```bash
mix phx.gen.auth Accounts User users
```

```bash
mix phx.gen.schema Accounts.User users name:string age:integer
```
