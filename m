Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B8815911CDB
	for <lists+nbd@lfdr.de>; Fri, 21 Jun 2024 09:33:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9B6D920C62; Fri, 21 Jun 2024 07:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 21 07:33:13 2024
Old-Return-Path: <taxoffcelimited@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 93A7420C5A
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jun 2024 07:17:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.821 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	UNWANTED_LANGUAGE_BODY=0.03] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LcyRPMb7T4W8 for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jun 2024 07:17:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F29C520C4F
	for <nbd@other.debian.org>; Fri, 21 Jun 2024 07:17:14 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d4430b8591so887619b6e.2
        for <nbd@other.debian.org>; Fri, 21 Jun 2024 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718954231; x=1719559031; darn=other.debian.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1YIxeipAVc5LQYIaRyJ8mumwC1UhziW1i7ZfDql3Lvw=;
        b=HY80zK2rW4XmtKYSnnJHeCh6i4YFSYG6MBfGhXLj2rwbbMs3TReODvQ3NFK67wD0P7
         ELITJTA9gAUkAw4egMYAJVJNjOx2FU3HcfHSS2QPWG1MuNh/fvx74up3S5IysAfjgyBq
         hVeGdnnpgWenKZh8aeRuXa9CtgbaDcgUXk5+b5+GjoPX5qp9BUsJdJnbYzvKOPeC0HvS
         zKKtNDGdYTDY+ATM2Nas4L2soR/VNEM+6d9pUOnFwQNi6NOk6uvQ0oefcllSf6gS5ghD
         RaL3iMBe/6X6X3agTBjRUUnsgKkDl1gSN3grnX2HrHcGg5dzF9d/UK2BqPDZ60JDdoH3
         5d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718954231; x=1719559031;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YIxeipAVc5LQYIaRyJ8mumwC1UhziW1i7ZfDql3Lvw=;
        b=ipmZa4BRwuKOfA9UldXhIYZo2bBeB/HdbbhOIbHi67rMS5uEsO8HZQlJMNuuhyB43P
         FR4IXxrkaSof+GkX6WB6XJ6N8WA91gxHOL3Vi+qXtnSZFrj2QMEe57vVX8T6Q0Zoxm35
         LA/NtPZWCIgU30FY/9Cy8nBc1Gx79AArLAn/BQLRjEqvxDnjvASlKUXFy7nrlgPFyujj
         GsdZezluKSoMMltByHN95bYLW5c9svlxGxJqyTsSYYmDf7vxdGqKtCWKyWHQOn/LnVsd
         kN08z7cW76IadjWOYaHl3VieNJFNYke4e2F4/ZvwocSCz5YdC3OstKCJuInZO4C4veqS
         SFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQOsMX2hpfHuixGggPdjaQS0r6xdV3jgDSVnTAVg/SjeaUSE141iC4k4l0Q/EsqSOkZCc53LBYfPOpYBWNdN09K+OmDw==
X-Gm-Message-State: AOJu0YwXHttl0K5C4uTE+YxvWEjeabNcq01UjZVtUCsCqSG2lFFNM5mt
	iSrwDNCVAhi6V18a2Y34VlMWhegSaDXiNEXgsjWImmiWXAtCfxwth0Blcm6B6Rs9sr2NvU1ra32
	e1ZqGqo7o3VaV9csL0TSkmqBzxUY=
X-Google-Smtp-Source: AGHT+IFJs3GAwGSJ0vxRXiIvSALYNdjZ3dpzR4MyNRt3bfVXm0PRghSxxiq2JknL+UlnSWReaJ8uts4BuHWvHXipghM=
X-Received: by 2002:a05:6808:1705:b0:3d4:41b6:6c4e with SMTP id
 5614622812f47-3d51b9b86a6mr8063929b6e.16.1718954231329; Fri, 21 Jun 2024
 00:17:11 -0700 (PDT)
MIME-Version: 1.0
From: Soros George <sorosgeorgewww@gmail.com>
Date: Fri, 21 Jun 2024 09:16:59 +0200
Message-ID: <CACVjM-M7dY593ThmUzYaKQj6ps4hnUzUnNRQ_fPKbp7yw35wOw@mail.gmail.com>
Subject: =?UTF-8?Q?Sie_haben_eine_Spende_von_=D0=8420=2E000=2E000?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000057ff7d061b613866"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HWq9e8JD7kD.A.hliK.5ySdmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3073
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACVjM-M7dY593ThmUzYaKQj6ps4hnUzUnNRQ_fPKbp7yw35wOw@mail.gmail.com
Resent-Date: Fri, 21 Jun 2024 07:33:13 +0000 (UTC)

--00000000000057ff7d061b613866
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guten Tag, Sie haben eine Spende in H=C3=B6he von =D0=8420.000.000  erhalte=
n. Mein
Name ist Soros George, meine Stiftung m=C3=B6chte Ihnen eine Spende in H=C3=
=B6he von
=D0=8420.000.000 anbieten und als gl=C3=BCcklicher Mensch werde ich spenden=
, um die
Wohlt=C3=A4tigkeitsorganisation Waisenhaus zu unterst=C3=BCtzen. Kontaktier=
en Sie
mich f=C3=BCr weitere Informationen, um Ihr gespendetes Geld zu erhalten: D=
ies
ist 100 % garantiert  https://www.youtube.com/watch?v=3DsuMviHNNk2U

--00000000000057ff7d061b613866
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Guten Tag, Sie haben eine Spende in H=C3=B6he von =D0=8420=
.000.000 =C2=A0erhalten. Mein Name ist Soros George, meine Stiftung m=C3=B6=
chte Ihnen eine Spende in H=C3=B6he von =D0=8420.000.000 anbieten und als g=
l=C3=BCcklicher Mensch werde ich spenden, um die Wohlt=C3=A4tigkeitsorganis=
ation Waisenhaus zu unterst=C3=BCtzen. Kontaktieren Sie mich f=C3=BCr weite=
re Informationen, um Ihr gespendetes Geld zu erhalten: Dies ist 100 % garan=
tiert =C2=A0<a href=3D"https://www.youtube.com/watch?v=3DsuMviHNNk2U" targe=
t=3D"_blank">https://www.youtube.com/watch?v=3DsuMviHNNk2U</a></div>

--00000000000057ff7d061b613866--

