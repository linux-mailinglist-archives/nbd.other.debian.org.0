Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD86189E2
	for <lists+nbd@lfdr.de>; Thu,  3 Nov 2022 21:48:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B335D20381; Thu,  3 Nov 2022 20:48:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov  3 20:48:12 2022
Old-Return-Path: <jonabob892@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,T_HK_NAME_FM_MR_MRS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B2470204AC
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Nov 2022 20:31:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.051 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	RCVD_IN_DNSWL_NONE=-0.0001, T_HK_NAME_FM_MR_MRS=0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BEsFs7Ojo2uj for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Nov 2022 20:31:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AD9A420435
	for <nbd@other.debian.org>; Thu,  3 Nov 2022 20:31:26 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id g10so3226957oif.10
        for <nbd@other.debian.org>; Thu, 03 Nov 2022 13:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ry4XDW7LNZmbgLEVEqgMlCOzpLIWl6VGThQJ3ssh1k8=;
        b=cpTxVGwnyZszru0ul6TnjehdQJEE/4sQCRNiOjsqLLffzGNZJK/wBOSEEBq7ohYESs
         q7cv+ZFZBGHDwUa5Jx4VZVlIHFcJzIcJkUt4H7AeIbAoEP2upQvSBLmJvSGqscP6RpY/
         jBEkZmzpytFu3xIGRrgPDELx0GaA008Khl49L3r3QRsd3mbX5Z/SXbbY4zjnRnQJ04fK
         JCffBR9sruMmnpUnXGFGbgT8Em74xW7fkuAnihSfD5k8ntO7jAbme2JauiNVsWe4T2xg
         H2g9yF5TXP4oQaVaM+tBHmyiZ5BcI8IhPvCcx+zhD5mB+yIEwnmkLA8WsPxq4jvmU0N0
         ONTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ry4XDW7LNZmbgLEVEqgMlCOzpLIWl6VGThQJ3ssh1k8=;
        b=xRwwfoldrAVaNr23uxzc/Tu9RBKr4/IBCPNd727fT7uwcOiaABJh7io2wnNLwSOPyr
         1BEVHhLwrKzW28uvo+9v7e0rRP3JEv7IS+XPmyJ7Vawb1Dzo19KpKkFY0Ap87eEDsRsZ
         4gMA8fZC5zIUx+dM5aLnv2+ZwBffbviEH3amjW2gb1f3uvkU7El1OCcCZQSWZZjfFD+3
         /MlhcLxZUpVqga69kFObiNu76C4k3gaQuE70w5Jt0U6sCGOGYNJIkRc67T3H21vEsFnf
         Zjec2BsjuD0HFYSB8WAKla3u72UGn2CsBPjuuTeqx9Cc0+jatcHKMG6emfWcse1D5QkK
         qOzA==
X-Gm-Message-State: ACrzQf1rikI/qX9nDnisr0oMX4sgSR/h9X2R97VuOVtSPtXt4n+Vkh14
	CMCwISJXzKNrJyzNCIq8csQakvQ90YwaXP9PQjw=
X-Google-Smtp-Source: AMsMyM52ngB8NoHl3BefmQpQhOgyrUtfIf0pavNsgV7irF0OIxroO6bYgcWWzFAVDEZ9/lUoy65FS4ADcGCz0gPsPG0=
X-Received: by 2002:a05:6808:1188:b0:351:5f92:3c52 with SMTP id
 j8-20020a056808118800b003515f923c52mr25810049oil.196.1667507483332; Thu, 03
 Nov 2022 13:31:23 -0700 (PDT)
MIME-Version: 1.0
From: "Mrs. Johanna Maaly Bob" <johannamaalybob01@gmail.com>
Date: Thu, 3 Nov 2022 20:31:03 +0000
Message-ID: <CABK9C0i=_9Ei9MSEp2Ne4ybJWe5bY4zOkxHFvdvFW04XWUvDOA@mail.gmail.com>
Subject: Hello Dear,
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000003456bf05ec96d7f4"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YBOjbyNk_BB.A.RPH.MkCZjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2245
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CABK9C0i=_9Ei9MSEp2Ne4ybJWe5bY4zOkxHFvdvFW04XWUvDOA@mail.gmail.com
Resent-Date: Thu,  3 Nov 2022 20:48:12 +0000 (UTC)

--0000000000003456bf05ec96d7f4
Content-Type: text/plain; charset="UTF-8"

Hello Dear, I was wondering if you received my email a couple of Days ago?
I would like to have a personal discussion with you. Please give me a quick
reply.
Yours sincerely,
Mrs. Johanna Maaly Bob,

--0000000000003456bf05ec96d7f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Dear, I was wondering if you received my email a cou=
ple of Days ago?=C2=A0 I would like to have a personal discussion with you.=
 Please give me a quick reply.<br>Yours sincerely,<br>Mrs. Johanna Maaly Bo=
b,<br></div>

--0000000000003456bf05ec96d7f4--

