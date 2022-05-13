---
weight: 3
title: "Theme Documentation - Built-in Shortcodes"
date: 2020-03-04T16:29:41+08:00
lastmod: 2020-03-04T16:29:41+08:00
draft: false
author: "Dillon"
authorLink: "https://dillonzq.com"
description: "Hugo provides multiple built-in shortcodes for author convenience and to keep your markdown content clean."
images: ["featured-image.png"]
resources:
- name: "featured-image"
  src: "featured-image.png"

tags: ["shortcodes"]
categories: ["documentation"]

lightgallery: true
---

**Hugo** provides multiple built-in shortcodes for author convenience and to keep your markdown content clean.

<!--more-->

Hugo uses Markdown for its simple content format. However, there are a lot of things that Markdown doesn’t support well. You could use pure HTML to expand possibilities.

But this happens to be a bad idea. Everyone uses Markdown because it’s pure and simple to read even non-rendered. You should avoid HTML to keep it as simple as possible.

To avoid this limitations, Hugo created [shortcodes](https://gohugo.io/extras/shortcodes/).
A shortcode is a simple snippet that can generate reasonable HTML code and conforms to Markdown's design philosophy.

Hugo ships with a set of predefined shortcodes that represent very common usage. These shortcodes are provided for author convenience and to keep your markdown content clean.

## 1 figure {#figure}

[Documentation of `figure`](https://gohugo.io/content-management/shortcodes#figure)

Example `figure` input:

```markdown
{{</* figure src="/images/lighthouse.jpg" title="Lighthouse (figure)" */>}}
```

The rendered output looks like this:

{{< figure src="/images/lighthouse.jpg" title="Lighthouse (figure)" >}}

The HTML looks like this:

```html
<figure>
    <img src="/images/lighthouse.jpg"/>
    <figcaption>
        <h4>Lighthouse (figure)</h4>
    </figcaption>
</figure>
```

## 2 gist

[Documentation of `gist`](https://gohugo.io/content-management/shortcodes#gist)

Example `gist` input:

```markdown
{{</* gist spf13 7896402 */>}}
```

The rendered output looks like this:

{{< gist spf13 7896402 >}}

The HTML looks like this:

```html
<script type="application/javascript" src="https://gist.github.com/spf13/7896402.js"></script>
```

## 3 highlight

[Documentation of `highlight`](https://gohugo.io/content-management/shortcodes#highlight)

## 4 instagram

[Documentation of `instagram`](https://gohugo.io/content-management/shortcodes#instagram)

{{< admonition question "Instagram’s API was deprecated since October 24th, 2020" >}}
The instagram-shortcode refers an endpoint of Instagram’s API, that’s deprecated since October 24th, 2020.
Thus, no images can be fetched from this API endpoint, resulting in an error when the instagram-shortcode is used.
For more information please have a look at GitHub issue [#7879](https://github.com/gohugoio/hugo/issues/7879).
{{< /admonition >}}

## 5 param

[Documentation of `param`](https://gohugo.io/content-management/shortcodes#param)

Example `param` input:

```markdown
{{</* param description */>}}
```

The rendered output looks like this:

{{< param description >}}

## 6 ref and relref {#ref-and-relref}

[Documentation of `ref` and `relref`](https://gohugo.io/content-management/shortcodes#ref-and-relref)

## 7 详见源网站

<https://hugoloveit.com/theme-documentation-built-in-shortcodes/>
