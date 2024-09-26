Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CC9873DF
	for <lists+nbd@lfdr.de>; Thu, 26 Sep 2024 14:54:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CB9C620525; Thu, 26 Sep 2024 12:54:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 26 12:54:13 2024
Old-Return-Path: <bahajoy63@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HK_NAME_FM_MR_MRS,HTML_MESSAGE,LOTS_OF_MONEY,MONEY,UNDISC_MONEY
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0B88020682
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Sep 2024 12:36:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.142 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	HK_NAME_FM_MR_MRS=0.03, HTML_MESSAGE=2, LOTS_OF_MONEY=0.001,
	MONEY=0.5, RCVD_IN_DNSWL_NONE=-0.0001, UNDISC_MONEY=1.53,
	UNWANTED_LANGUAGE_BODY=0.03] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oigV6jNPPM9X for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Sep 2024 12:36:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5F86420586
	for <nbd@other.debian.org>; Thu, 26 Sep 2024 12:36:05 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6ddceaaa9f4so8384347b3.2
        for <nbd@other.debian.org>; Thu, 26 Sep 2024 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727354161; x=1727958961; darn=other.debian.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q9H6mscJ57lJCpOAgRVC0wGPDxu7EBr5BH4f8SquBFI=;
        b=dVK7FCzlBf0lrIj9SY2gXW0Z/jRC9MRm3VUROz4IUcE72Bnii0Diuf1FGBYhPLzRy9
         vjIvRQW7ohNtXybEwNlVS+LtiMg49aCFEQNz91cTnE7WbsIDzMOIK32GlHlVevrqZ9q+
         F3tgnf3v1R1F/3G+N1BGic9NoS41jSPkXGmxs62bwzM2297u0XifcRceRlzYc/6Z6GYq
         hbNkBF6YnY06YPK7vVnv/c4xmUBf0Tep9GQYO7a3FmJkbd1Wuw1NCh7R/haFD2IY/sNe
         lA5hj5GwVfh/0kMtrAjNFA8tzmNxhP3EUr+wFKWs/Zf+u2PITUxBrzjNQuNE6vtkR9i3
         MEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727354161; x=1727958961;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9H6mscJ57lJCpOAgRVC0wGPDxu7EBr5BH4f8SquBFI=;
        b=P1Pr/UZPhLhcUbLV/J5ctFKUBQj3VyCRF6clobxOLHIZILjIXnJc3a+jr4UYehH6aE
         creZoFJTc1H7SFuhISEZq9lZlTVj6qPv9Z/2Pttyc4UrZ5paq4NJy2YCA5ZKsk3jlGcf
         uHUsBGV2IQO5N9h2LDSZg+75XzG8LtX6a5Omt98k3ir3zVKdn/9f8OZg0hOu/f2gOzIl
         pbSopdemceSeGzr8/aAid/2IfNHECi403YCb+OyKm7EOMEMaL/rCI5IFY1wTQC8s3m4+
         D/isyu6aOjxabScpDLTwWYbp5aJrhmnbiWoTp4TBpTZJTpKcyCduf/a3XA0785B4DiD7
         0pwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT8kfLxMFiwCusKbz10T59MdEm6R3lpROK9Ic0tnE1QlSFggB0YdNngmbOd4kkTQ9v3BU=@other.debian.org
X-Gm-Message-State: AOJu0Yy3c4xZeCTizO5i33vUEH/gL47AYgWfaHXInhfMmUaJaebrumAp
	r9PgMhLShVKiP4ms4U+ncvk83sJr03vnAwx42wK1X5DDDiTAhzHWp+I4XkrL7cytX7YCddmM6lz
	8d+u/2gTjdPeZQyHeN492JPn1w10=
X-Google-Smtp-Source: AGHT+IFyGaICnCb7NLtVsH3m9DO692l1HsaY4PlOWR2qZStyLeGDf6UVuLBcCRggJs7mbganmLjheCXw5VddCLn6wdM=
X-Received: by 2002:a05:690c:17:b0:6dd:d894:bc40 with SMTP id
 00721157ae682-6e21d9c05c9mr57215757b3.26.1727354161158; Thu, 26 Sep 2024
 05:36:01 -0700 (PDT)
MIME-Version: 1.0
From: "Mr. John Robinson" <jhrobinson1956@gmail.com>
Date: Thu, 26 Sep 2024 07:35:47 -0500
Message-ID: <CABbyfzDAzMrdNo0mWgC_QLgS8aNu+jASecmKyvjO7=fLPdXgFQ@mail.gmail.com>
Subject: Donatie in geld!
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002d6499062304fb87"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EdmDTyj-ueO.A.xWsB.1lV9mB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3150
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CABbyfzDAzMrdNo0mWgC_QLgS8aNu+jASecmKyvjO7=fLPdXgFQ@mail.gmail.com
Resent-Date: Thu, 26 Sep 2024 12:54:13 +0000 (UTC)

--0000000000002d6499062304fb87
Content-Type: text/plain; charset="UTF-8"

U bent de gelukkige winnaar. De som van (EUR 1.500.000) is aan u gedoneerd
door de heer John Robinson. Reageer op de e-mail voor meer informatie

--0000000000002d6499062304fb87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr">U bent de gelukkige winnaar. De s=
om van (EUR 1.500.000) is aan u gedoneerd door de heer John Robinson. Reage=
er op de e-mail voor meer informatie<br></div></div></div></div>

--0000000000002d6499062304fb87--

