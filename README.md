# [![repo logo][]][Kicksware url]

<p align="center">
	<a href="https://kicksware.com">
		<img src="https://img.shields.io/website?label=Visit%20website&down_message=unavailable&up_color=teal&up_message=kicksware.com%20%7C%20online&url=https%3A%2F%2Fkicksware.com">
	</a>
</p>

[![commit activity badge]][repo commit activity]&nbsp;
[![db mongo badge]][repo commit activity]&nbsp;
[![db postgres badge]][repo commit activity]&nbsp;
[![fs gluster badge]][repo commit activity]&nbsp;
[![elastic stack badge]][repo commit activity]&nbsp;
[![kubernetes badge]](https://kubernetes.io)&nbsp;

[![gitlab badge]](https://ci.kicksware.com/kicksware/kicksware-tool-stack)&nbsp;
[![tool-stack pipeline]](https://ci.kicksware.com/kicksware/tool-stack/-/commits/master)&nbsp;
[![license badge]](https://www.gnu.org/licenses/agpl-3.0)

## Overview

_**Kicksware Tool Stack**_ is a composite [DevOps][devops] technology stack solution dedicated to provision data, storage, continuous deployment, analytics, monitoring, and more tools needed for Kicksware infrastructure to function as complete autonomous mechanism.

## DevOps

To constantly deliver its particular set of services every component of Kicksware infrastructure goes through its own development life cycle, every new iteration of which is triggered by every new commit to the codebase.

From there it goes through the individual set of stages, each dedicated to ensure the best possible software quality, Generally, these stages are representing base steps needed to build, test and deploy every new piece of code committed to repositories. Although sometimes additional steps are required, such as resolving dependencies, preparing the environment and finale checks whether the pipeline succeeded and services are ready to serve.

This whole process is accordingly called [Continuous delivery (deployment) and continuous integration (CI/CD)][continuous delivery]. In fact, this practice is so crucial and adopted that currently there are [more than 50 CI/CD][50 ci\cd] tools out there waiting to be used.

Kicksware's CI\CD deployment pipeline is based on [Gitlab CI Community Edition][gitlab ce]. As a matter of fact, [continuous delivery][gitlab ci] is only one side of its [diverse comprehensive feature set][gitlab features]. Besides it, things like Git repositories storage, container and package registries, issue tracking, and really a lot more great features that makes GitLab a complete DevOps platform for any types of system.

[![kicksware ci browser][]][kicksware ci url]

## Applications

Aside from development and deployment enhancement tools, Kicksware application services themselves require some additional tools to be able to perform tasks they programmed for.

The most obvious application is of course databases. Without storing any data it is nearly impossible to achieve the fulfillment of all the business requirements. Therefore, to store user, product, orders, and reference data Kicksware tool stack contain both [document-based MongoDB][mongodb] and [relational PostgreSQL][postgresql]. And for caching, [blazing-fast Redis][redis] is used, as it is a key-value based, distributed, in-memory database.

In addition, some services depends on a more specific type of software. For instance, a search microservice is requiring some kind of search engine, to deliver the result faster and more efficient. So for this particular use case, [Elasticsearch][elasticsearch] is used, witch in combination with the [Kibana][kibana] analytics dashboard web application produce [Elastic Stack solution][elastic stack]. Some of the [Elastic's][elastic co] [observability tools][elastic observability] are also worth noting, like [LogStash][elastic logstash] and [Beats][elastic beats] for gathering logs and metrics. And overall experience using [this company's software][elastic co] is pretty much awesome, so it's definitely an advise.

[![kibana browser][]][analytics url]

## Requirements

## Deployment

## Wrap Up

## License

Licensed under the [GNU AGPL-3.0][license file].

[repo logo]: https://ci.kicksware.com/kicksware/tool-stack/-/raw/master/assets/repo-logo.png
[kicksware url]: https://kicksware.com

[Website badge]: https://img.shields.io/website?label=Visit%20website&down_message=unavailable&up_color=teal&up_message=kicksware.com%20%7C%20online&url=https%3A%2F%2Fkicksware.com
[commit activity badge]: https://img.shields.io/github/commit-activity/m/timoth-y/kicksware-tool-stack?label=Commit%20activity&color=teal
[repo commit activity]: https://github.com/timoth-y/kicksware-tool-stack/graphs/commit-activity
[lines counter]: https://img.shields.io/tokei/lines/github/timoth-y/kicksware-tool-stack?color=teal&label=Lines
[db mongo badge]: https://img.shields.io/badge/DB-MongoDB-informational?style=flat&logo=mongoDB&logoColor=white&color=60A053&logoColor=60A053
[db postgres badge]: https://img.shields.io/badge/DB-PostgreSQL-informational?style=flat&logo=postgresql&logoColor=3C87B7&color=4e7cac
[fs gluster badge]: https://img.shields.io/badge/FS-Gluster-informational?style=flat&logo=buffer&logoColor=white&color=CE9F3B
[elastic stack badge]: https://img.shields.io/badge/Tools-Elastic%20Stack-informational?style=flat&logo=elastic%20stack&logoColor=56BCB2&color=teal
[license badge]: https://img.shields.io/badge/License-AGPL%20v3-blue.svg?color=teal
[kubernetes badge]: https://img.shields.io/badge/DevOps-Kubernetes-informational?style=flat&logo=kubernetes&logoColor=white&color=316DE6
[gitlab badge]: https://img.shields.io/badge/CI-Gitlab_CE-informational?style=flat&logo=gitlab&logoColor=white&color=FCA326
[tool-stack pipeline]: https://ci.kicksware.com/kicksware/tool-stack/badges/master/pipeline.svg?key_text=Tool%20Stack%20|%20pipeline&key_width=125

[devops]: https://aws.amazon.com/devops/what-is-devops/
[continuous delivery]: https://aws.amazon.com/devops/continuous-delivery/
[50 ci\cd]: https://stackify.com/top-continuous-integration-tools/
[gitlab ce]: https://about.gitlab.com/stages-devops-lifecycle/
[gitlab ci]: https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/
[gitlab features]: https://about.gitlab.com/features/

[kicksware ci browser]: https://ci.kicksware.com/kicksware/tool-stack/-/raw/master/assets/gitlab-browser.png
[kicksware ci url]: https://ci.kicksware.com/kicksware

[postgresql]: https://www.postgresql.org/
[mongodb]: https://www.mongodb.com/
[redis]: https://redis.io/
[elasticsearch]: https://www.elastic.co/elasticsearch/
[kibana]: https://www.elastic.co/kibana
[elastic stack]: https://www.elastic.co/elastic-stack
[elastic observability]: https://www.elastic.co/observability
[elastic logstash]: https://www.elastic.co/logstash
[elastic beats]: https://www.elastic.co/beats/
[elastic co]: https://www.elastic.co/about/

[kibana browser]: https://ci.kicksware.com/kicksware/tool-stack/-/raw/master/assets/kibana-browser.png
[analytics url]: https://analitics.kicksware.com/app/observability#/overview

[docker-desktop]: https://docs.docker.com/desktop/
[docker-compose]: https://docs.docker.com/compose/
[compose config]: https://github.com/timoth-y/kicksware-tool-stack/blob/master/docker-compose.yml
[ci compose config]: https://github.com/timoth-y/kicksware-tool-stack/blob/master/.gitlab/.gitlab-ci.compose.yml
[ci k8s config]: https://github.com/timoth-y/kicksware-tool-stack/blob/master/.gitlab-ci.yml

[helm]: https://helm.sh/
[helm chart]: https://github.com/timoth-y/kicksware-tool-stack/tree/master/webapp-chart

[license file]: https://github.com/timoth-y/kicksware-tool-stack/blob/master/LICENSE
