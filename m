Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0576F730
	for <lists+nbd@lfdr.de>; Fri,  4 Aug 2023 03:54:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE6BF205D8; Fri,  4 Aug 2023 01:54:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  4 01:54:12 2023
Old-Return-Path: <matt.panaro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=ATTENDEES_DBSPAM_BODY6,
	ATTENDEES_DBSPAM_BODY7,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,HTML_MESSAGE,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D69FF20582
	for <lists-other-nbd@bendel.debian.org>; Fri,  4 Aug 2023 01:38:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.911 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY6=1, ATTENDEES_DBSPAM_BODY7=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7ZVHStVS3YsX for <lists-other-nbd@bendel.debian.org>;
	Fri,  4 Aug 2023 01:38:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 94CFB20556
	for <nbd@other.debian.org>; Fri,  4 Aug 2023 01:38:29 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-56ca4d7079aso1097580eaf.0
        for <nbd@other.debian.org>; Thu, 03 Aug 2023 18:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691113106; x=1691717906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MCYiWac7WLVpUosQFTB7HZKzVuPo2/fUUu7ljFMFMp4=;
        b=q2P3vgRGn9qUr8mpDdOZRwCGjamyMbW0wY4BA80jAvSjPYgFYt415IBDMz3ru+bSMH
         QlY0RCWxn6tVWS1Txd1Wq6u/27TSVzLrIJylSATHuStW4/bLmmWGDTUGA4iGmAdOEir7
         2uEIweis1RvUojciFcB2CVocKKk5JFGJRl6bnXS1oPQXtINs724zh6dsSEjc1QlYnNlF
         XwWM7+v8D2apTEV0V2olH7XgwVKr/zuRV7dwLV+8UeIMqSGGB1z16vvMhFrclecJtPvp
         TgByq/6sdOljfIRh28dkKuhYryFuOgd5+ABxil69j4iKq+ckLJOxCXEhmz/1ngfggR4h
         1Akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691113106; x=1691717906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCYiWac7WLVpUosQFTB7HZKzVuPo2/fUUu7ljFMFMp4=;
        b=PBkN0zYP8/kfL7GuoJiDTZA4yhQzMJW1eL8yCg7TOklZedTYAkOkpzoEB/5OqXbHAy
         CGnJi1ja1MqrLRmtpGNTtGhbyTKhY5Vn6cxxyOOVm6Pk0dnTblJnjtBtrBE69pYL9mkT
         bntkIlNGSZxoBzZf+4ULRxGY0liBtKNxvqnVQppcN89W8e5+eqa8ao0QYcE2Gd/COhJK
         NREvRDdaq3083Atu2dv7Qarh7+bcKv03VHUS/M2Q/2gtvHFhJ9R6E3Yh5W5SE95ly4AQ
         y86gdX8qgr+kAGYGiZwHbR2JUbpPB4dK3I8MBihSmoyLcIBTmHpEP3ElGM0WUsXCy+K/
         AxSA==
X-Gm-Message-State: AOJu0Yz5ofdqN2Jj+0FPRUFglJVvsABF+MOJVfh2NDKBHkxBfo5e8MDc
	00aHc6Y7HldzSNf0PvPh2dKB5+3uZdWw8Fjj7HN4a8GQ7OM=
X-Google-Smtp-Source: AGHT+IGjaBCyq2mfLG4Vc7t4RnrgYU7ggRg13LTjvSkzU0wsJziTZ3mFwm00YH4CFhiE7B7e8JagtTiu+x7+Dj3BDxk=
X-Received: by 2002:a05:6358:8a6:b0:133:eff:39c with SMTP id
 m38-20020a05635808a600b001330eff039cmr317146rwj.20.1691113105733; Thu, 03 Aug
 2023 18:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com>
 <ZMkHk3buC5qskubT@pc220518.home.grep.be> <CAAki=DVAvo3OxusJDkErPifHwnPOgW=SEj=5zja34Djr9ARajQ@mail.gmail.com>
 <ZMltOf3PhVyI4jhI@pc220518.home.grep.be>
In-Reply-To: <ZMltOf3PhVyI4jhI@pc220518.home.grep.be>
From: Matt Panaro <matt.panaro@gmail.com>
Date: Thu, 3 Aug 2023 21:38:14 -0400
Message-ID: <CAAki=DWVvUH4-6uq0sTsbq=8gD0Z_-XdYmpSMAW4cM7NYwrOGQ@mail.gmail.com>
Subject: Re: [PATCH] fix missing -F short-option for certfile [version 2]
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="000000000000f13e3106020ef323"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VaJOt-TYAlN.A.U7H.EpFzkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2591
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAki=DWVvUH4-6uq0sTsbq=8gD0Z_-XdYmpSMAW4cM7NYwrOGQ@mail.gmail.com
Resent-Date: Fri,  4 Aug 2023 01:54:12 +0000 (UTC)

--000000000000f13e3106020ef323
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ok, here's a PR: https://github.com/NetworkBlockDevice/nbd/pull/151
should I remove the indentation around the conditional substrings?

On Tue, Aug 1, 2023 at 4:38=E2=80=AFPM Wouter Verhelst <w@uter.be> wrote:

> Hi Matt,
>
> On Tue, Aug 01, 2023 at 12:16:55PM -0400, Matt Panaro wrote:
> >    so when I did `git format-patch`, I omitted the bottom 2 lines from
> the
> >    output in the email (it was a string of 3 hyphens, and the
> git-version,
> >    IIRC): are those mandatory?
>
> I don't think so, no.
>
> So "git format-patch" is a good start, but if you use that (and not git
> send-email), then you should make sure that your mail client doesn't
> mangle the output.
>
> In your case, we got:
>
> - a text/plain and text/html MIME part, which results in "git am" trying
>   to match the HTML version of the patch in the original source file
>   (and that going horribly wrong, for obvious reasons)
> - Your mail client having replaced at least one horizontal tab character
>   by 8 spaces, which means the patch lines do not match anymore, even
>   after I just extracted the text/plain part of your email to a file.
>
> and possibly a few other things -- I didn't go over the patch with a
> fine-toothed comb ;-)
>
> The easiest way around this is to use "git send-email", which takes the
> output of "git format-patch" and sends it to the recipient without any
> mangling going on, either through /usr/bin/sendmail, or (if you haven't
> configured that, which is very reasonable in today's world) through a
> direct SMTP connection (with support for pretty much all types of SMTP
> authentication that may be required in today's world).
>
> Failing that, you can also add the output of "git format-patch" as an
> attachment. This allows me to apply it cleanly again. But that's
> actually more work than just using "git format-patch", honestly ;-)
>
> >    I can either put a snippet on github and send the link; or I could t=
ry
> >    opening up an actual PR on GitHub, if that's permissible;
>
> These both work too, if you prefer.
>
> >    or I can try replying again w/ the full/unadulterated
> >    `format-patch` output in the body of hte email (I think I also
> >    removed the subject-line from the output and put it directly in the
> >    email subject-line? maybe I should've just left everything as-was;
> >    too used to github's workflow)
>
> This might go wrong again, if your mail client decides that "this tab
> character is silly, let's change that" or some similar silliness. You
> probably shouldn't do that.
>
> --
>      w@uter.{be,co.za}
> wouter@{grep.be,fosdem.org,debian.org}
>
> I will have a Tin-Actinium-Potassium mixture, thanks.
>

--000000000000f13e3106020ef323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ok, here&#39;s a PR: <a href=3D"https://github.com/Ne=
tworkBlockDevice/nbd/pull/151">https://github.com/NetworkBlockDevice/nbd/pu=
ll/151</a></div><div>should I remove the indentation around the conditional=
 substrings?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Aug 1, 2023 at 4:38=E2=80=AFPM Wouter Verhels=
t &lt;<a href=3D"mailto:w@uter.be">w@uter.be</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Matt,<br>
<br>
On Tue, Aug 01, 2023 at 12:16:55PM -0400, Matt Panaro wrote:<br>
&gt;=C2=A0 =C2=A0 so when I did `git format-patch`, I omitted the bottom 2 =
lines from the<br>
&gt;=C2=A0 =C2=A0 output in the email (it was a string of 3 hyphens, and th=
e git-version,<br>
&gt;=C2=A0 =C2=A0 IIRC): are those mandatory?<br>
<br>
I don&#39;t think so, no.<br>
<br>
So &quot;git format-patch&quot; is a good start, but if you use that (and n=
ot git<br>
send-email), then you should make sure that your mail client doesn&#39;t<br=
>
mangle the output.<br>
<br>
In your case, we got:<br>
<br>
- a text/plain and text/html MIME part, which results in &quot;git am&quot;=
 trying<br>
=C2=A0 to match the HTML version of the patch in the original source file<b=
r>
=C2=A0 (and that going horribly wrong, for obvious reasons)<br>
- Your mail client having replaced at least one horizontal tab character<br=
>
=C2=A0 by 8 spaces, which means the patch lines do not match anymore, even<=
br>
=C2=A0 after I just extracted the text/plain part of your email to a file.<=
br>
<br>
and possibly a few other things -- I didn&#39;t go over the patch with a<br=
>
fine-toothed comb ;-)<br>
<br>
The easiest way around this is to use &quot;git send-email&quot;, which tak=
es the<br>
output of &quot;git format-patch&quot; and sends it to the recipient withou=
t any<br>
mangling going on, either through /usr/bin/sendmail, or (if you haven&#39;t=
<br>
configured that, which is very reasonable in today&#39;s world) through a<b=
r>
direct SMTP connection (with support for pretty much all types of SMTP<br>
authentication that may be required in today&#39;s world).<br>
<br>
Failing that, you can also add the output of &quot;git format-patch&quot; a=
s an<br>
attachment. This allows me to apply it cleanly again. But that&#39;s<br>
actually more work than just using &quot;git format-patch&quot;, honestly ;=
-)<br>
<br>
&gt;=C2=A0 =C2=A0 I can either put a snippet on github and send the link; o=
r I could try<br>
&gt;=C2=A0 =C2=A0 opening up an actual PR on GitHub, if that&#39;s permissi=
ble;<br>
<br>
These both work too, if you prefer.<br>
<br>
&gt;=C2=A0 =C2=A0 or I can try replying again w/ the full/unadulterated<br>
&gt;=C2=A0 =C2=A0 `format-patch` output in the body of hte email (I think I=
 also<br>
&gt;=C2=A0 =C2=A0 removed the subject-line from the output and put it direc=
tly in the<br>
&gt;=C2=A0 =C2=A0 email subject-line? maybe I should&#39;ve just left every=
thing as-was;<br>
&gt;=C2=A0 =C2=A0 too used to github&#39;s workflow)<br>
<br>
This might go wrong again, if your mail client decides that &quot;this tab<=
br>
character is silly, let&#39;s change that&quot; or some similar silliness. =
You<br>
probably shouldn&#39;t do that.<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0w@uter.{be,<a href=3D"http://co.za" rel=3D"noreferrer" =
target=3D"_blank">co.za</a>}<br>
wouter@{<a href=3D"http://grep.be" rel=3D"noreferrer" target=3D"_blank">gre=
p.be</a>,<a href=3D"http://fosdem.org" rel=3D"noreferrer" target=3D"_blank"=
>fosdem.org</a>,<a href=3D"http://debian.org" rel=3D"noreferrer" target=3D"=
_blank">debian.org</a>}<br>
<br>
I will have a Tin-Actinium-Potassium mixture, thanks.<br>
</blockquote></div>

--000000000000f13e3106020ef323--

