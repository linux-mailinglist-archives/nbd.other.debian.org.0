Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB158B756
	for <lists+nbd@lfdr.de>; Sat,  6 Aug 2022 19:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 01F072067A; Sat,  6 Aug 2022 17:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug  6 17:48:08 2022
Old-Return-Path: <misetichrvoje@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E5A522065E
	for <lists-other-nbd@bendel.debian.org>; Sat,  6 Aug 2022 17:30:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.209 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VgSrPq_4DWwM for <lists-other-nbd@bendel.debian.org>;
	Sat,  6 Aug 2022 17:30:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3211D2065C
	for <nbd@other.debian.org>; Sat,  6 Aug 2022 17:30:44 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31f41584236so49092947b3.5
        for <nbd@other.debian.org>; Sat, 06 Aug 2022 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=38eiQc1L3NU3Vvg3ZnnKf7+3TLkBz4uvdlrk2+e5tP4=;
        b=aYf3vKOu0Ac3++k8biARNew6wb582QTwbupWHbYkyd1Be5xZ3IZ0iZHOEx71xMGDn6
         6x5I5w7nrV3rTYa0DD2prJ0EU70PAf3noVSZdHo12dnphJ+UQzxu1U+l9Dfl9wKJlSk0
         fRhLLXimJA0D2qsr9rrospgC5kvFyrwEb2pjimf+YqKzJGGIxFTOvfNNb/6cRrYjDI0B
         gH5DzZCs74poSuwrWFmyfJI5XOjesIonaEKOj1KvKmLFCFMQVYQU8Td0Nr2Eu2MmD0OP
         xI7VKPiyD0DVbp6IehVirYy0+TNLzN8D5Bg+HBcENN7fm8tYR92z41crVoiO583Ok87k
         78mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=38eiQc1L3NU3Vvg3ZnnKf7+3TLkBz4uvdlrk2+e5tP4=;
        b=ZtxmRpVeDPghNOtESKBzio+zUECX25barwEtihlOzMVYc7azPNY6aBSg8hnYSzoLq7
         qsfFNnxM1w5bji3osV/TYpBvYohdf+LcFiyTSQlv+pJlCS0ZfVNN+oxgcalZRyK3aPOu
         pRUCgBoBAq8RQID4j3YR7xNqAmPBU4vgt9f2GfkvX0Vxnnj4/M1Ucptk+KPKXP9gyEbm
         XVgkJhSl+uLi/sTqtnU1k0zLwkvp/ty7jDQLCSzzXTzdw8IjvevgvbrRlmKNaOJwFK7v
         8s7gJXnGijDVw9W/At7Ukxp/pFvGJmwqUWzLF/b9PzvPCB/AlgIQpZ5AGXlzkQpd3eMo
         jQyA==
X-Gm-Message-State: ACgBeo04kR3z07wZj0/q9rosWPoVBOPJtTVMiAEsHwm5v6t/DpEC/6cg
	kG9W6Sk3oUzhAzUXenSj+DLY12oCPrp97xSuRaBDIYFUcIY=
X-Google-Smtp-Source: AA6agR4MYXN36u9bXa6B3JJ0qD+tt81XCsIqBr9tmQP4XctNocNi2EiwlwS5U+DQt5tKxJWTRSOycFM0ubbkOxmND1o=
X-Received: by 2002:a0d:ca52:0:b0:328:3044:412f with SMTP id
 m79-20020a0dca52000000b003283044412fmr11081400ywd.60.1659807040683; Sat, 06
 Aug 2022 10:30:40 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SHJ2b2plIE1pxaFldGnEhw==?= <misetichrvoje@gmail.com>
Date: Sat, 6 Aug 2022 19:30:29 +0200
Message-ID: <CAGakKvwSV1Sb--wP2TRVGHyjfbPC9UBVL0gj+ePbeJwiY56O6w@mail.gmail.com>
Subject: NetworkBlockDevice memory corruption
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="0000000000000e436d05e595f19a"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kxNSYyVWiC.A.beC.Ylq7iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2209
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAGakKvwSV1Sb--wP2TRVGHyjfbPC9UBVL0gj+ePbeJwiY56O6w@mail.gmail.com
Resent-Date: Sat,  6 Aug 2022 17:48:09 +0000 (UTC)

--0000000000000e436d05e595f19a
Content-Type: text/plain; charset="UTF-8"

Hello,

I have found a memory corruption bug in nbd-client.c (
https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-client.c) for the
latest 3.24 release. Where should I report it?

Cheers,
Hrvoje

--0000000000000e436d05e595f19a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I have found a memory=
 corruption bug in nbd-client.c (<a href=3D"https://github.com/NetworkBlock=
Device/nbd/blob/master/nbd-client.c">https://github.com/NetworkBlockDevice/=
nbd/blob/master/nbd-client.c</a>) for the latest 3.24 release. Where should=
 I report it?</div><div><br></div><div>Cheers,</div><div>Hrvoje<br></div></=
div>

--0000000000000e436d05e595f19a--

