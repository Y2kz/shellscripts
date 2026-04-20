Syntax / Usage

```bash
rsync -avz --partial Win11_24H2_EnglishInternational_x64.iso root@10.152.188.50:/root/
```

Use Below one for more Integrity check

PUSH 
```bash
rsync -avz --append-verify Win11_24H2_EnglishInternational_x64.iso root@10.152.188.50:/root/
```

PULL
```bash
rsync -avz --append-verify ivr@172.16.17.75:/opt/ivr/prbtcontent_live11072025.tar.gz .
```