Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76D69458C
	for <lists+nbd@lfdr.de>; Mon, 13 Feb 2023 13:15:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5F033210E6; Mon, 13 Feb 2023 12:15:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 13 12:15:11 2023
Old-Return-Path: <bamiwolananzifou@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,GMAIL,HK_SCAM,
	RCVD_IN_DNSWL_NONE,SARE_HEAD_8BIT_SPAM autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 726A4210AC
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Feb 2023 11:58:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.687 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, GMAIL=1, HK_SCAM=1.998,
	RCVD_IN_DNSWL_NONE=-0.0001, SARE_HEAD_8BIT_SPAM=0.888]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pRx66r_GIFsW for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Feb 2023 11:58:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-vs1-xe42.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BBDC5210CC
	for <nbd@other.debian.org>; Mon, 13 Feb 2023 11:58:27 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id k4so12764924vsc.4
        for <nbd@other.debian.org>; Mon, 13 Feb 2023 03:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lW/hnKNdMita/ZCBN8W9ECVqokLcfslxfFj3FWgs7aY=;
        b=nd+PE3DdO5S0hoq74dT/5A7U6EJFTkHUYhOR22IPTEsRlKQJ5PIcUTenoe/IV1DQwl
         ETALaNJZA/nKzUk14zQ7uZJFKro3W9+QaultbB8dw8C02Nvp/1jT5biNxvT2y6nbCNFD
         /zAneSmKefGAaj/2bRMd7VTMcDYP9P9gGbKulOYJDx9tli90ZutUZ+74KgRNFjBxQ78a
         atogDONCEhaKx8IGRif/8yqfqBuSjrcx42FwygC+YwuMZYDxRkVgJiJpKL4zZxJjIHf1
         ae91Bmp0k7u7wxZaevKkLzjhSW5iqeSaPtIRCBKfgSv2ljCLlt2gWIgTvR4YTWXuf6b5
         tAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW/hnKNdMita/ZCBN8W9ECVqokLcfslxfFj3FWgs7aY=;
        b=zelkZ/zJpGz3V3KQU2wZQQ+jHrY7HxvggQvqdTGITmu3QtH8UPoXH3V8Yji2AIuqxt
         zXr+8CA8or7x9VQZFHssaS7vDHy065gL3YvDViNWqEUMNq5S3To/uD0pZf8SF0qfjTGj
         15FhPPRSqATpVzljkLvhnIpMdBVuGnBhnNQZIEijJ6QhmH5wNRdNwVYbhlPufdCvsNWY
         NcK+/4fKiSgEIjy/Ba8YJywju/Zr3GWAekXGwwH88msb0fOqsZT/2ru+CipyX3A4zMSD
         VNpClNwOjPN5bqsIMtegdJWyXtZj52KKJt8xMc7eA8aeebf4U00d2PwfrJBknyCkUE2d
         5FHA==
X-Gm-Message-State: AO0yUKUMyvQMiutYw7RinQOmAt//UCXInczJc16Mzg1EgfmrpFEJdsY9
	qsJukV2QlrghzUYepJNtor/XCLXyaDXiifWyKg==
X-Google-Smtp-Source: AK7set/DtgrCMyNAUKCpfBdyECbReGoYEQFetOSjCY3gq6j1l0cO4XpixtV7fL8yWBrEE1jbBHFXO2wTX5nu4B++miE=
X-Received: by 2002:a05:6102:53c4:b0:3f0:8af8:6a78 with SMTP id
 bs4-20020a05610253c400b003f08af86a78mr4272186vsb.55.1676289504146; Mon, 13
 Feb 2023 03:58:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:cbe1:0:b0:38c:985a:78a7 with HTTP; Mon, 13 Feb 2023
 03:58:23 -0800 (PST)
Reply-To: madis.scarl@terlera.it
From: "Ms Eve from U.N" <bamiwolananzifou@gmail.com>
Date: Mon, 13 Feb 2023 12:58:23 +0100
Message-ID: <CAPhMf3kC9bFFSC0M_FCiTeOD1zUuHzGiWEge1rd527gcLY6NAw@mail.gmail.com>
Subject: =?UTF-8?B?VnQ6IEh5dsOkw6QgaHVvbWVudGE=?=
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qxIWDYJB6wI.A.WxF.Pni6jB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2327
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPhMf3kC9bFFSC0M_FCiTeOD1zUuHzGiWEge1rd527gcLY6NAw@mail.gmail.com
Resent-Date: Mon, 13 Feb 2023 12:15:11 +0000 (UTC)

Hei hyv=C3=A4=C3=A4 huomenta,
T=C3=A4ll=C3=A4 haluamme huomauttaa, ett=C3=A4 kaikki pyrkimyksemme ottaa s=
inuun yhteytt=C3=A4
t=C3=A4m=C3=A4n kautta s=C3=A4hk=C3=B6postiosoitteesi ep=C3=A4onnistui. Ota=
 yst=C3=A4v=C3=A4llisesti
yhteytt=C3=A4 asianajajaan.
Steven Mike { mbarrsteven@gmail.com } yksityisess=C3=A4 s=C3=A4hk=C3=B6post=
issaan
vaatimus korvausoikeudesta

Huomautus: Sinun on maksettava toimitusmaksu.
Vilpitt=C3=B6m=C3=A4sti sinun
Rouva EVE LEWIS
********************************************************
Hello Good Morning,
This is to bring to your notice that all our efforts to contact you
through this your email ID failed Please Kindly contact Barrister.
Steven Mike { mbarrsteven@gmail.com } on his private email for the
claim of your compensation entitlement

Note: You have to pay for the delivery fee.
Yours Sincerely
Mrs EVE LEWIS

