Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3D320524C
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2020 14:21:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 76A7E205BD; Tue, 23 Jun 2020 12:21:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 23 12:21:28 2020
Old-Return-Path: <bakert.jg@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,ONEWORD,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2E222205CC
	for <lists-other-nbd@bendel.debian.org>; Tue, 23 Jun 2020 12:04:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.791 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	FREEMAIL_REPLYTO=1, ONEWORD=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ap8eAPuaqOAx for <lists-other-nbd@bendel.debian.org>;
	Tue, 23 Jun 2020 12:04:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EB2BA205CB
	for <nbd@other.debian.org>; Tue, 23 Jun 2020 12:04:19 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j10so6519259qtq.11
        for <nbd@other.debian.org>; Tue, 23 Jun 2020 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=7fNnQnFssZCc2Jtw2cUlJB4v7zrpRiQS682aXMZO9+Q=;
        b=Y8PmfMpPzB9QiwEMuRZCKJ9ALoAoL8zNH/sLM119qQYLQG1Aml6e/2nyDv9m2H89i0
         861ikjb0w5JBCsCkUadkGbw/EHo7eCqHqalfzCmWvQUhS+6ouyo//iyUbDQe94+mggz9
         fvlQU5JeF4RlwsrambZ1iCKXh0AVWXSq6+0aT6Zg86ZmAjWDk2rvcoxrEgcKKhSc7VLr
         Ssv2LOd4y0JkaPYC/f09oLGD9j2C2h4E5ZXrEWb67zvPRj6wV9Sk8USEUyhOMF5lPVSF
         eY3jD4KEmmMQBMEpXxeUfgqp2eJnfWaDDL+fyXaIUJmdbwAYV4yfp4wemO2f1Vro2wcL
         DH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=7fNnQnFssZCc2Jtw2cUlJB4v7zrpRiQS682aXMZO9+Q=;
        b=Gar6i2aliKpHKIkLVLraneKgRRIbpov85iL+3TMbc5E9Onr4hxcum1C2gYbbJ31J41
         mRAxzmYsN7+FL//in9J7oYy8qCoO07ENBt9vSSEy7wmos7iwu8mfT5ZUoEDWlHejNZKj
         dL1fById9RrmrTkKsO+eDslgvRFJOCYrv0UyBMjHk+VVLZ+S4IW/4UgBlVjK1HOo/LF4
         xNxSxYGKfaAfPgUXmAmVeNtxhigy7KCwbI22bL63uidrN/BlkkiXxyIfHNFMJg1p+oOJ
         uf/fcd+1FpPuV89IwpMVa3WFTOSRwO9qlZbO3LSUovoJDEIR68x0weeM5Uol5gtpZXT1
         JUlA==
X-Gm-Message-State: AOAM530ZQOx2F7T+6EWOqj0OsvCOX+b0QBP75sYm+AmIr+6TorF+Ux+E
	LDC0zHTLtYlc5Kvkf1YOkBHmo+kYH4sXkj0Udxo=
X-Google-Smtp-Source: ABdhPJx9St5Sp8Z82DENca20COjZOVBKxAz+iDHRT8NlyxRimAB7EIMG7j6LSnVbLmdvNaTItk884W5nuEHsitvl9VE=
X-Received: by 2002:aed:3b33:: with SMTP id p48mr21039194qte.205.1592913856953;
 Tue, 23 Jun 2020 05:04:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:47c2:0:0:0:0:0 with HTTP; Tue, 23 Jun 2020 05:04:16
 -0700 (PDT)
Reply-To: bektery@outlook.com
From: YAVUZ BEKTER <bakert.jg@gmail.com>
Date: Tue, 23 Jun 2020 05:04:16 -0700
Message-ID: <CAAUSuTVovQuOZnQA4YGKai-f7mB6Q_U_yFT84WeqM6ZHaOVa8g@mail.gmail.com>
Subject: Hello.
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eC159qq7XfB.A.5P.IPf8eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/909
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAUSuTVovQuOZnQA4YGKai-f7mB6Q_U_yFT84WeqM6ZHaOVa8g@mail.gmail.com
Resent-Date: Tue, 23 Jun 2020 12:21:28 +0000 (UTC)

I am the foreign operations director of Bank of Turkey.
My name is Mr, Yavuz. I have a sensitive investment project to discuss
with you, please reply now.
________________________
Ik ben de directeur buitenlandse activiteiten van de Bank of Turkey.
Mijn naam is meneer Yavuz. Ik moet een gevoelig investeringsproject bespreken
met u, antwoord dan nu.

