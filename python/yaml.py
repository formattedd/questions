import yaml

with open("config.yaml", "w") as outfile:
    yaml.dump(
        data,
        outfile,
        default_flow_style=False,
        allow_unicode=True,
        sort_keys=True,
    )
