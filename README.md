* https://www.base64encode.org/
* http://textmechanic.co/Line-Length-Breaker.html
* https://github.com/jenkinsci/job-dsl-plugin/wiki

@ADAM ---
Even easier - scan the /hab/svc directories for config.toml. Any service that exports cfg.iptables or cfg.sysctl, you auto configure
Use inotify to watch for dynamic changes
Might be the simplest path
---

{code}
java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://127.0.0.1:8080 help
java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://127.0.0.1:8080 install-plugin job-dsl -deploy
{code}
