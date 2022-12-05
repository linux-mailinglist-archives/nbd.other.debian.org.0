Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F5642E74
	for <lists+nbd@lfdr.de>; Mon,  5 Dec 2022 18:15:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 433C1205BD; Mon,  5 Dec 2022 17:15:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec  5 17:15:15 2022
Old-Return-Path: <lometogo1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,ONEWORD,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C0F1203D6
	for <lists-other-nbd@bendel.debian.org>; Mon,  5 Dec 2022 16:57:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.331 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
	FREEMAIL_FROM=0.001, FREEMAIL_REPLYTO=1,
	FREEMAIL_REPLYTO_END_DIGIT=0.25, ONEWORD=2,
	RCVD_IN_DNSWL_NONE=-0.0001, UNWANTED_LANGUAGE_BODY=0.03]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id i2Nf2lhloBnC for <lists-other-nbd@bendel.debian.org>;
	Mon,  5 Dec 2022 16:57:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9BC8320442
	for <nbd@other.debian.org>; Mon,  5 Dec 2022 16:57:42 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id v70so5351468oie.3
        for <nbd@other.debian.org>; Mon, 05 Dec 2022 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=VU/rgGptryVM4aPYZQbohImQqbgl0JvAoWg9a8C9MNf9oPdauFysGkKXeGF9WXVP52
         8DVEGr1dURgaKwq47TSHQ3aA0SjgoVhNUVFfq3BWQEXinvbOp0TPmpxOLm3jS/djnTZ3
         5/N+W3t4uesFDJW3zfpRi34RdOTyAsqCslb6BczNkWfSW1omkXFo8LmAlXP3UU+iK3sq
         /y5pdpRPW0Wff2yc4YFX1GQ0AxpbTjwEJRFpltTuErOoh9ZJsIafUmgcqGdOJdf3GqnN
         TUBqB4MCmik1tZmNbh3J87J5xy3ZjrfQm4CI6DOcJWGQHAZZ5hLVEOtySQs+9PWtNXsu
         57ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=LQQZIMJKp4ieqwj2VN5iTUd3tCIsXyo68EHbVxAuMqXz5N9Tj5LNQ5/NiOWxO3MtzI
         ZFPKaM1pDFt1FNNYX1LjiFbb6/Qyvq6c8/iiPYDboLR7cYOp4X7jrxjxkSpverOOFa3Q
         2PGQfzj582R5opUFRfJJ+IF1LeS9AYhW7TgMFdD/o/eRyQVVHQwffFsjAV2L9eb3tFQO
         x/bQQ1xpHcB9leURZjPULHIbxWBHp5vGHLKpWNfr2emLRjW6YEzLrluYBEKfV+oZqD2+
         M5bd1mLsuZyqWiZdEhw32ehFF+uBzy0pJcWjNdDGpLTvjXxTkXNVhEoqMOeMn0IvMekF
         Go2w==
X-Gm-Message-State: ANoB5pmHJJYzga1TOUdh7mENaTAixZ2cv3BPuETb5YaEyYBnVYcM80e3
	iv95gUGjoi805Oi4K8t6NST0ugznfDgN80uekKzbzBe+Ca5VNQ==
X-Google-Smtp-Source: AA0mqf5dCpTCr36eOYWnDYtucH84k4BwRCGBoYpUdcNugkYyE2m7KHfaXSzH4pe3hWmQ15G2xkpX6DgKnbkSj3yqc2g=
X-Received: by 2002:a05:6870:c895:b0:13a:dd7e:7bda with SMTP id
 er21-20020a056870c89500b0013add7e7bdamr48370932oab.222.1670259111862; Mon, 05
 Dec 2022 08:51:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:7211:b0:dd:1fa2:ef73 with HTTP; Mon, 5 Dec 2022
 08:51:51 -0800 (PST)
Reply-To: plml47@hotmail.com
From: Philip Manul <lometogo1999@gmail.com>
Date: Mon, 5 Dec 2022 08:51:51 -0800
Message-ID: <CAFtqZGFeAqprpMRj5=K8vh=qSW9zGnADZ52PuZe=8Nv3Go6XTg@mail.gmail.com>
Subject: REP:
To: in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nwGO1mpsVhH.A.LLG.jcijjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2313
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFtqZGFeAqprpMRj5=K8vh=qSW9zGnADZ52PuZe=8Nv3Go6XTg@mail.gmail.com
Resent-Date: Mon,  5 Dec 2022 17:15:15 +0000 (UTC)

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.

