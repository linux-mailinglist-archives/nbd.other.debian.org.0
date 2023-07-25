Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE30761B63
	for <lists+nbd@lfdr.de>; Tue, 25 Jul 2023 16:24:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2F6C1206E7; Tue, 25 Jul 2023 14:24:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 25 14:24:16 2023
Old-Return-Path: <matt.panaro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 35AB0206D0
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Jul 2023 14:07:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.811 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fOwoNtOMClwc for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Jul 2023 14:07:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0269B206CA
	for <nbd@other.debian.org>; Tue, 25 Jul 2023 14:07:46 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-57026f4bccaso69307317b3.2
        for <nbd@other.debian.org>; Tue, 25 Jul 2023 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690294063; x=1690898863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7AkpBCrGoPF4p8SrhApQgzWipVfZm1ZGuWBGOcMBQ7U=;
        b=Q4DZECBvak5qfTyHVNEoooKVUD5GBu3PWEh2KC6SkaZhVg+AG1mijIJPfHwDUTc2QZ
         RCS/JtnQlSfE0WppK7b7UuC/ycGwImwApWzO2+5o5kbKqpskJPK2RjQj/vcqRM+Lvvu8
         PRDpcLf9/SqqwDcLAWao5qvKc9DYqKUS9EEE0CVdR0+7QKdqLDcIwufcr5ZIvzW8pED4
         gqgdTyem2yS2uwb2LatWNnpnQjeVc6yfEjCbzfp6tZXvMFEi+rpTz0W27p3Ns9rLPhIv
         vVgm10JN9OnMD1e1Rd73haOlcUVa4CVFCpHyx77rkt5phOBwXzyBw3NOFEocBFSMvw8Z
         IT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294063; x=1690898863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AkpBCrGoPF4p8SrhApQgzWipVfZm1ZGuWBGOcMBQ7U=;
        b=XoxDxcAOcqT1i08FfPEkk02bvYTnhJNFlpqJT03F5XoIg8xIB0Zl6KCI/ub/3/O6pd
         C+0yFHuFKrQc8G/0OK+fE86AIm8JQ8HIBXzl4CygOcW+2M4ADD0pQc51de1dZEvfWCze
         lfIgfzR8JDdUu+fq5h9l15icSQ8nJNFMINjJ/xQMEzFKATbbIsHSzF2F7ToexmuHjSM3
         O0umwMqQQzdiR5x2ik1oO873JPOq0sjtvRZEAijBkRVIGna5bMwORO3AtlecfWYP004g
         IOBkLO10oVuV4VXYgAlvs6o0Oike31JcEDRN/b8fLZp3NQPPmjVyGjma0OfWLcfo8eAb
         JeSQ==
X-Gm-Message-State: ABy/qLbVWBWluT3HJppG1rfGuKwWBHwV11ahYjnc384E16V4+7ARB3Gn
	W+XpPO+YbnxG2b9wa0MPBfNNV6Bzz+obd+hjV08=
X-Google-Smtp-Source: APBJJlEPyByigxxK79W8m23j+AmAiTbz2FYkwK88W7fYEjJqjVqjWQFMmifuU2iCdE4sFChVqOFkB34ZBl/6CFhKdfc=
X-Received: by 2002:a81:6c14:0:b0:583:8c5f:5363 with SMTP id
 h20-20020a816c14000000b005838c5f5363mr10521329ywc.23.1690294063476; Tue, 25
 Jul 2023 07:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAAki=DWr+Kft898C=ABtmXdSyWhPoL55vO5fFjwoH-m6TNNoqQ@mail.gmail.com>
 <awg5aw5d357ljrbhmordwtfjmlhbqhhkqdcbv6y3femzpjq3ca@q4xlmzddloqj>
In-Reply-To: <awg5aw5d357ljrbhmordwtfjmlhbqhhkqdcbv6y3femzpjq3ca@q4xlmzddloqj>
From: Matt Panaro <matt.panaro@gmail.com>
Date: Tue, 25 Jul 2023 10:07:34 -0400
Message-ID: <CAAki=DWH-BT8hJkb+n0TOhB9e7z7vAQoCWdUDgW-dT_vRF2ypA@mail.gmail.com>
Subject: Re: patch to fix short-option for certfile (-F) in nbd-client
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="0000000000003834d206015041a6"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PYhu4iYZ5AD.A.JbC.Ps9vkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2580
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAki=DWH-BT8hJkb+n0TOhB9e7z7vAQoCWdUDgW-dT_vRF2ypA@mail.gmail.com
Resent-Date: Tue, 25 Jul 2023 14:24:16 +0000 (UTC)

--0000000000003834d206015041a6
Content-Type: text/plain; charset="UTF-8"

I like the second option that avoids the #else branches, even at the cost
of losing the alphabetical ordering.  this is the first time I've submitted
a code-change through email rather than e.g. GitHub, so I'm a bit uncertain
about how to proceed. should I reply with an updated diff? start a new
thread?
also, who would I ask for/how would I get the "signed off by"?

one more thing: there's a slightly larger additional change/feature I'd
like to implement: is the correct thing to do start a codeless discussion
on the mailing list? or just send a larger diff (with appropriate
references to commit-hashes)?


On Mon, Jul 24, 2023, 10:44 Eric Blake <eblake@redhat.com> wrote:

> Thanks for noticing the bug, and supplying a potential patch.  While
> the subject line is accurate for 'what changed', git commits are
> usually better if they also include a body stating 'why the change is
> important'.  In this case, I'd add at a minimum:
>
> Fixes: 18ceafed ("Add options to nbd-client for TLS support", v3.15)
>
> or the longer:
>
> When TLS support was added in commit 18ceafed, there were four long
> options added, but only 3 short option aliases.  Fix the missing
> intended alias of -F for --certfile.
>
>
> I also don't know if Wouter has a strong policy on Signed-off-by:
> attribution, but you may want to add one.
>
> On Sat, Jul 22, 2023 at 10:48:08AM -0400, Matt Panaro wrote:
> > --- a/nbd-client.c
> > +++ b/nbd-client.c
> > @@ -897,9 +900,9 @@ void disconnect(char* device) {
> >  }
> >
> >  #if HAVE_NETLINK
> > -static const char *short_opts = "-A:B:b:c:C:d:gH:hK:LlnN:PpRSst:uVx";
> > +static const char *short_opts = "-A:B:b:c:C:d:F:gH:hK:LlnN:PpRSst:uVx";
> >  #else
> > -static const char *short_opts = "-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx";
> > +static const char *short_opts = "-A:B:b:c:C:d:F:gH:hK:lnN:PpRSst:uVx";
> >  #endif
>
> Looking at 18ceafed, I'm wondering why we maintain two separate
> short_opts lists in the first place.  It is just as easy to ALWAYS
> accept the options, and have the options produce an error when they
> are unsupported (see how F,K,A,H are handled in #ifdef WITH_GNUTLS
> later on), as long as there is some easy way to probe whether a given
> binary was compiled with or without gnutls and/or netlink support.
>
> Another option might be to change the contents of short_opt (but at a
> loss of alphabetical ordering), as in:
>
> static const char *short_opts = "-"
> #ifdef WITH_GNUTLS
>   "A:F:H:K:"
> #endif
> #ifdef HAVE_NETLINK
>   "L"
> #endif
>   "B:b:c:C:d:ghlnN:PpRSst:uVx";
>
> where you can then avoid the #else branches later in the switch
> statement for processing getopt results if the same conditionals are
> added around the corresponding long options.
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.
> Virtualization:  qemu.org | libguestfs.org
>
>

--0000000000003834d206015041a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I like the second option that avoids the #else branc=
hes, even at the cost of losing the alphabetical ordering.=C2=A0 this is th=
e first time I&#39;ve submitted a code-change through email rather than e.g=
. GitHub, so I&#39;m a bit uncertain about how to proceed. should I reply w=
ith an updated diff? start a new thread?<div dir=3D"auto">also, who would I=
 ask for/how would I get the &quot;signed off by&quot;?</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">one more thing: there&#39;s a slightly larg=
er additional change/feature I&#39;d like to implement: is the correct thin=
g to do start a codeless discussion on the mailing list? or just send a lar=
ger diff (with appropriate references to commit-hashes)?</div><br><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 24,=
 2023, 10:44 Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thanks for n=
oticing the bug, and supplying a potential patch.=C2=A0 While<br>
the subject line is accurate for &#39;what changed&#39;, git commits are<br=
>
usually better if they also include a body stating &#39;why the change is<b=
r>
important&#39;.=C2=A0 In this case, I&#39;d add at a minimum:<br>
<br>
Fixes: 18ceafed (&quot;Add options to nbd-client for TLS support&quot;, v3.=
15)<br>
<br>
or the longer:<br>
<br>
When TLS support was added in commit 18ceafed, there were four long<br>
options added, but only 3 short option aliases.=C2=A0 Fix the missing<br>
intended alias of -F for --certfile.<br>
<br>
<br>
I also don&#39;t know if Wouter has a strong policy on Signed-off-by:<br>
attribution, but you may want to add one.<br>
<br>
On Sat, Jul 22, 2023 at 10:48:08AM -0400, Matt Panaro wrote:<br>
&gt; --- a/nbd-client.c<br>
&gt; +++ b/nbd-client.c<br>
&gt; @@ -897,9 +900,9 @@ void disconnect(char* device) {<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 #if HAVE_NETLINK<br>
&gt; -static const char *short_opts =3D &quot;-A:B:b:c:C:d:gH:hK:LlnN:PpRSs=
t:uVx&quot;;<br>
&gt; +static const char *short_opts =3D &quot;-A:B:b:c:C:d:F:gH:hK:LlnN:PpR=
Sst:uVx&quot;;<br>
&gt;=C2=A0 #else<br>
&gt; -static const char *short_opts =3D &quot;-A:B:b:c:C:d:gH:hK:lnN:PpRSst=
:uVx&quot;;<br>
&gt; +static const char *short_opts =3D &quot;-A:B:b:c:C:d:F:gH:hK:lnN:PpRS=
st:uVx&quot;;<br>
&gt;=C2=A0 #endif<br>
<br>
Looking at 18ceafed, I&#39;m wondering why we maintain two separate<br>
short_opts lists in the first place.=C2=A0 It is just as easy to ALWAYS<br>
accept the options, and have the options produce an error when they<br>
are unsupported (see how F,K,A,H are handled in #ifdef WITH_GNUTLS<br>
later on), as long as there is some easy way to probe whether a given<br>
binary was compiled with or without gnutls and/or netlink support.<br>
<br>
Another option might be to change the contents of short_opt (but at a<br>
loss of alphabetical ordering), as in:<br>
<br>
static const char *short_opts =3D &quot;-&quot;<br>
#ifdef WITH_GNUTLS<br>
=C2=A0 &quot;A:F:H:K:&quot;<br>
#endif<br>
#ifdef HAVE_NETLINK<br>
=C2=A0 &quot;L&quot;<br>
#endif<br>
=C2=A0 &quot;B:b:c:C:d:ghlnN:PpRSst:uVx&quot;;<br>
<br>
where you can then avoid the #else branches later in the switch<br>
statement for processing getopt results if the same conditionals are<br>
added around the corresponding long options.<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libguestfs.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libguestfs.org</a><br>
<br>
</blockquote></div></div></div>

--0000000000003834d206015041a6--

