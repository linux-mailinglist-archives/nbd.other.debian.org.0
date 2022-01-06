Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3254869FE
	for <lists+nbd@lfdr.de>; Thu,  6 Jan 2022 19:33:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 67C5720385; Thu,  6 Jan 2022 18:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  6 18:33:09 2022
Old-Return-Path: <j06217505@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,ONEWORD,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2A3AD2037A
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Jan 2022 18:17:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	ONEWORD=2, RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Kc4C7dDDi2Y3 for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Jan 2022 18:16:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9685920334
	for <nbd@other.debian.org>; Thu,  6 Jan 2022 18:16:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x7so6692960lfu.8
        for <nbd@other.debian.org>; Thu, 06 Jan 2022 10:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=a7iwzmO2IfUO2MPBRaYwnVhk9snz3Hs0brWVsp9hqYg=;
        b=b2nFK0dyl+tMN6pn3PwyjdpcQeJlhRG2k3FbV9OS6lKlyVISuTm44zjCR0oKqEMrDc
         olUJ3ImtMVzu9o3EzJiDO/pTHJnsZC2LiLg0fWv3edxLhzdGrNrLnNpJlAMutf8g6nSM
         FQmGwiGB5dQTddJRB5lGJKOzlguv2wSfd2SxqDqtOcqPAqTqxiIGzWu9Pk0HPY8ES5iU
         RzyjuQ0w5iyJHS4m83lyHCQSz7Wtpo0FW+U3ubS/Xlw5iFFgv/uU87WX5WJA1TevPsI5
         hqJAOV8FcqczQIpf4ZBodZPmm/4p7X1xuVnmSkpB6g+C1qY+ZIxg4hkrQZ7BjBMXxQY8
         txBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a7iwzmO2IfUO2MPBRaYwnVhk9snz3Hs0brWVsp9hqYg=;
        b=gEYXAAXQZqI0Cy2eTd0ozb+zOz8WodlXwLGZFr4Afts/jiUJnT+KVHn7RNEMPcKO2D
         irU58jCdXTfL5+8aJJIHbuiIL90J1ZWVfr49neGHv5GpV9JqZmvVZWcQb0ae/WRhdx7m
         VTfYDrUjpSZgT9IY43uyHsHPZWbybJ2kZr5bWw0E8/urDaAxObDWyxsPTwUnQciJrgOf
         EDZQiR8tZ108tw3Dq27OhyQEINehk/ojxp85P3zaJRHeqxgXqKGLYH184r48Wo9B2KOy
         /DLRSFej0jMyOdp26eWxleLMxdx1ZF1GNeRdaPOtJ2tCv5/aYVhwjJnCvjIYMwXlzcwR
         Ib4A==
X-Gm-Message-State: AOAM533EwMeDhg6OoI0RcGHTyYooVOfZdyXFmov0uPzyejniiWz/oSSr
	GPWtX1wggn+fF0xbOOqV81uzubSxyMIFc6GHxp8=
X-Google-Smtp-Source: ABdhPJw2YW7q9RasF/Li4cjXntJ+HYp9gthhYVQheNJW0PUiD1SCbJ6pshkqy6f/QKzdS8r5XGkclbPblWmYJrunq1o=
X-Received: by 2002:a05:6512:3b26:: with SMTP id f38mr54744090lfv.374.1641493009800;
 Thu, 06 Jan 2022 10:16:49 -0800 (PST)
MIME-Version: 1.0
From: yacine  8447904 <yacinebeker88@gmail.com>
Date: Thu, 6 Jan 2022 19:16:37 +0100
Message-ID: <CA+QAkA-+=ZrW69-8LDwchSuOc9yYMqKVn2j13gP5hSoHAsmeHA@mail.gmail.com>
Subject: hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000c021ee05d4eddfc5"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TOdMY6s87EF.A.txF.lXz1hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1671
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CA+QAkA-+=ZrW69-8LDwchSuOc9yYMqKVn2j13gP5hSoHAsmeHA@mail.gmail.com
Resent-Date: Thu,  6 Jan 2022 18:33:09 +0000 (UTC)

--000000000000c021ee05d4eddfc5
Content-Type: text/plain; charset="UTF-8"

My name is yacine can i talk to you

--000000000000c021ee05d4eddfc5
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br clear="all"><div><div dir="ltr" class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr">My name is yacine can i talk to you<br></div></div></div></div>

--000000000000c021ee05d4eddfc5--

