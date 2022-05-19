Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414D52DB8E
	for <lists+nbd@lfdr.de>; Thu, 19 May 2022 19:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 39D5F2034F; Thu, 19 May 2022 17:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 19 17:45:10 2022
Old-Return-Path: <omotosofunmilayoruth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B4B0A202D3
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 May 2022 17:27:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.781 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lGPZaM9CH3bW for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 May 2022 17:27:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 49B05201F3
	for <nbd@other.debian.org>; Thu, 19 May 2022 17:27:15 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id n24so2215936uap.13
        for <nbd@other.debian.org>; Thu, 19 May 2022 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=sDfxx5UMy9OH2go+MO6k8VCx6Zv/NWbTw60pJcKIt1o=;
        b=E89RJTS2kkODINe6UJHTLugH6AGA93Dx1Xw6NR7YxQE6rmHRknpIxXn+kN7vBQ6g5V
         4dnW44HCQUx6gZSN1P3TU/RvcnyIFygPSlqpz/M8MLbquoTSLeRPA2m55X97WfiwwGdW
         ojhapzWhEypvMcvEoWrdukrJSiaefO+CUB6ykdnWLZTw53hURGRl1co9PcaXRpxRUjF7
         jeB41z/Ofei8HJg/wC7SMeWlw/hRN3CUUOwUIi5+1mZ7XDu/c8qVMBRa4HzZZMqGaz0R
         34/+O6crDORMVDKG1AUMKO7cv6b7s1TB/wpVH+z87OETDv0c3oWHQm6oinOsQroIzx/G
         FLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sDfxx5UMy9OH2go+MO6k8VCx6Zv/NWbTw60pJcKIt1o=;
        b=DFhuzw3vnjC5XegQSU1HYHul2zaaHDpW4d6MrNyn2rbbhLoMF6piBjP8ogJzswkHhr
         TFA3wqXubTfSh2XcB2WlfTTo5R0UrMyEC0VubG8sqcu1G3XW8s9aa95AdG1FXJJ0NQ2j
         Q1LhdOtGonlB9viwVoVsa1eZLk7fXT18ybWpuOELvoeBEppc/K0YKdMPre4jv6hZ3q9I
         h3+DtpmjdWcYq4pftPWq8kKDqU+Qa93exQkvQP44DpsCifT3CHhy0pTVpVTnJ19Zua/Z
         0sp6jRPzFGmpFAwOmz8Y0MCki36caThAUom/C623KkpFbUHnaT7KVcNf1K2R8JrCW1gD
         WwZQ==
X-Gm-Message-State: AOAM531jvtFkxqKW33Y8pdUJ+XdLUF9VfSNJSAPwUD5HMLWZDKWSyfU5
	EMd8Lg9yj7BhfbKxt6jY9rnHZCcRV/m1UABD0nA=
X-Google-Smtp-Source: ABdhPJxeLCTr3x8fKDn/ykQ3CoAxpahifslCYaCH5UYwriJoNPmOvw/aLtEaavBdmIERzkmTx7SazZ9hi9LK+fgY7hA=
X-Received: by 2002:ab0:330c:0:b0:368:c3d5:8b46 with SMTP id
 r12-20020ab0330c000000b00368c3d58b46mr2578061uao.55.1652981231576; Thu, 19
 May 2022 10:27:11 -0700 (PDT)
MIME-Version: 1.0
From: Jessica Kiirnec <omotosofunmilayoruth@gmail.com>
Date: Thu, 19 May 2022 19:27:01 +0200
Message-ID: <CAGvCTiEpJT5sOnWuhR0LYbPL3QzAgn9R5vLqRFoMT+Vz=PhbkQ@mail.gmail.com>
Subject: ''How are you today?
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000020e9f405df60af5e"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <URGkqIIhNdM.A.dzB.mIohiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2085
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAGvCTiEpJT5sOnWuhR0LYbPL3QzAgn9R5vLqRFoMT+Vz=PhbkQ@mail.gmail.com
Resent-Date: Thu, 19 May 2022 17:45:10 +0000 (UTC)

--00000000000020e9f405df60af5e
Content-Type: text/plain; charset="UTF-8"

J. Kirinec
1166 Mohican Trail, Stone Mountasin, Georgia 30083
Marital Status: Single
occupation:  Marine Nurse



          ''How are you today? fine i hope. It's nice to meet you, I hope
you do not mind me being connected with you in such a way. Actually, I was
looking for my old friend when I came across your profiles. I must say that
you are different. I believe it's curiosity that brings me to you, i will
wish to meet you, I believe that both of us want the same thing. Once again
I must say that I am sorry if the connection with you contradicts your
moral ethics. I look forward to hearing from you. J. Kirinec.

--00000000000020e9f405df60af5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;fo=
nt-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><div><p style=3D"margin:0px">J. Kirinec<br aria-hidden=3D"true">11=
66 Mohican Trail, Stone Mountasin, Georgia 30083<br aria-hidden=3D"true">Ma=
rital Status: Single<br aria-hidden=3D"true">occupation:=C2=A0 Marine Nurse=
<u></u><u></u></p></div><div><p style=3D"margin:0px"><u></u>=C2=A0<u></u></=
p></div></div><p style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,s=
ans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;margin:0px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#3=
9;How are you today? fine i hope. It&#39;s nice to meet you, I hope you do =
not mind me being connected with you in such a way. Actually, I was looking=
 for my old friend when I came across your profiles. I must say that you ar=
e different. I believe it&#39;s curiosity that brings me to you, i will wis=
h=C2=A0to meet you, I believe that both of us want the same thing. Once aga=
in I must say that I am sorry if the connection with you contradicts your m=
oral ethics. I look forward to hearing from you. J. Kirinec.</p>

</div>

--00000000000020e9f405df60af5e--

