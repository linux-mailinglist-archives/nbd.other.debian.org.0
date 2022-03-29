Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C30224EB5FB
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 00:30:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 77A972141B; Tue, 29 Mar 2022 22:30:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 29 22:30:13 2022
Old-Return-Path: <adeboyejofolashade55@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,GMAIL,LOTS_OF_MONEY,MONEY,
	MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE,
	T_US_DOLLARS_3 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 81F54213A2
	for <lists-other-nbd@bendel.debian.org>; Tue, 29 Mar 2022 22:14:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=4.823 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	FREEMAIL_REPLYTO=1, FREEMAIL_REPLYTO_END_DIGIT=0.25, GMAIL=1,
	LOTS_OF_MONEY=0.001, MONEY=0.5, MONEY_FREEMAIL_REPTO=0.001,
	PYZOR_CHECK=2, RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	T_US_DOLLARS_3=0.01, UNWANTED_LANGUAGE_BODY=0.03]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BLHVDNahc_QE for <lists-other-nbd@bendel.debian.org>;
	Tue, 29 Mar 2022 22:14:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D73DE2139F
	for <nbd@other.debian.org>; Tue, 29 Mar 2022 22:14:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d7so26744751wrb.7
        for <nbd@other.debian.org>; Tue, 29 Mar 2022 15:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=hHSTOnS61GmzikUVcbjZs7Z4wiDc6fX50YgbJ5ae3Ib7Py/ccALeD5eOwhvtc0/zr6
         1dfYr3cGIbK4Gdus4EDqmH0BYUURz+1YaEwim4m+TjgNgjYnT0Upv7FrRMT2vyyX0Om4
         i5eS6R2KLsPWb8aQEOltb3kXJo8aRl70OMML3vJYe/S+Ef0LYC5scCUoC8YrElSsOgGs
         ymtaFh5Me6O414v11siqDdw0PDVmONsRu37Y0ebA3nhUO2agZ0LZuCFMRlku2h6iomiC
         sXUhP8IK2R8FU7QK+6iHn4E8Bcgu/s032YnsQVrbWcQoIeNCRG7EdJzwGbfsZzNBveh9
         ouIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=UTMOwFqKs/kVo23WcIgeZc6O+BhV1YCUfEDEaq6gkqQuw1mzaGY5HSHFaXpvhXb4YE
         7z487lqAdy1Kb8ipDi/Xderd6bkurmQ5nyfu+dmj8z7ix/dezWZKUARTlaqDMpSz8l2H
         1pwXdWF23case0Yw1JejpE4s68/8fRbLvp2tkQ4fOMxwYdXMFGpu+dlVB1IDyyh3VXQS
         T4gAbH99dFmZrBMAtfkC0ayLU3k6ijmknEzkvvGLYRIJRxaInvKMk75oUA1R6dLnutvX
         Hh4K75I0WESsf9WtG/UR4h+hIWGG5E4gxTg2JrZMiWi5Rt6Dobf4fGU+e5+Nbm1RLdF1
         39Sg==
X-Gm-Message-State: AOAM5338skxVwWpVeLKrhfq/qH26CGkyXwYHpSQXhUqnsW5rgPpJq2XY
	F8gbTQW3OCslb4hvGrieX+o=
X-Google-Smtp-Source: ABdhPJzSsStXLUQGMJ8s22ypX/GOcEooDy42Y64QQyppu+DmWIIfad6RzJEqkN6RkQFP870iXIswsw==
X-Received: by 2002:a5d:6511:0:b0:204:62a:20fc with SMTP id x17-20020a5d6511000000b00204062a20fcmr33314935wru.352.1648592076082;
        Tue, 29 Mar 2022 15:14:36 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.172])
        by smtp.gmail.com with ESMTPSA id r13-20020adfbb0d000000b00203e0efdd3bsm16158256wrg.107.2022.03.29.15.14.31
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:14:35 -0700 (PDT)
Message-ID: <624384cb.1c69fb81.4a583.fa01@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To: Recipients <adeboyejofolashade55@gmail.com>
From: adeboyejofolashade55@gmail.com
Date: Tue, 29 Mar 2022 23:14:27 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZxgYuwRnOfF.A.kcH.1h4QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1822
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/624384cb.1c69fb81.4a583.fa01@mx.google.com
Resent-Date: Tue, 29 Mar 2022 22:30:13 +0000 (UTC)

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.

