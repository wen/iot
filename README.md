# Inception of Things

<img width="400px" align="right" alt="Curve Inception of Things" src="https://user-images.githubusercontent.com/22397481/163789570-6e50e533-786f-4af4-8f2f-9151bb38d30f.png">

## Introduction
This project aims to deepen our knowledge by making us use [K3d](https://k3d.io) and [K3s](https://k3s.io) with [Vagrant](https://www.vagrantup.com/).

We will learn how to set up a personal virtual machine with Vagrant and CentOS. 

Then, we will learn how to use K3s and its [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/). 

Last but not least, we will discover K3d that will simplify our life.

These steps will get us started with [Kubernetes](https://kubernetes.io/).

> This project is a minimal introduction to Kubernetes.</br>
> Indeed, this tool is too complex to be mastered in a single subject.

## General guidelines
1. The whole project has to be done in a virtual machine.
2. We have to put all the configuration files of our project in folders located at the root of the repository (go to Submission and peer-evaluation for more information). The folders of the mandatory part will be named: **[p1](https://github.com/wen/iot/tree/master/p1)**, **[p2](https://github.com/wen/iot/tree/master/p2)** and **[p3](https://github.com/wen/iot/tree/master/p3)**. And the bonus one: **[bonus](https://github.com/wen/iot/tree/master/bonus)**.
3. This topic requires us to apply concepts that, depending on our background, we may not have covered yet. Therefore we will not be afraid to read a lot of documentation to learn how to use **K8s** with **K3s**, as well as **K3d**.

> We can use any tools we want to set up our host virtual machine as well as the provider used in Vagrant.

## Mandatory part

This project will consist of setting up several environments under specific rules.

It is divided into three parts we have to do in the following order:
- **`Part 1`**: K3s and Vagrant
- **`Part 2`**: K3s and three simple applications
- **`Part 3`**: K3d and Argo CD

## Bonus part
The following extra is intended to be useful: [Gitlab](https://about.gitlab.com/) needs to be added in the lab we did in [Part 3](https://github.com/wen/iot/tree/master/p3).

**This bonus is complex**. The latest version available of Gitlab from the official website is expected.

We are allowed to use whatever we need to achieve this extra. For example, [helm](https://helm.sh) could be useful here.
- Our Gitlab instance must run locally
- Gitlab must be configured to make it work with our cluster
- A dedicated namespace named `gitlab` needs to be created
- Everything we did in [Part 3](https://github.com/wen/iot/tree/master/p3) must work with our local Gitlab

We can add everything needed so our entire cluster works.
