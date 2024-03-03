


```
sudo subscription-manager repos \
--enable rhocp-4.15-for-rhel-9-$(uname -m)-rpms \
--enable fast-datapath-for-rhel-9-$(uname -m)-rpms


sudo dnf install -y microshift
```