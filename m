Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BCB57C57D
	for <lists+nbd@lfdr.de>; Thu, 21 Jul 2022 09:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 229AE203DF; Thu, 21 Jul 2022 07:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 21 07:45:10 2022
Old-Return-Path: <williamsjeff277@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,ONEWORD,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 75AA6203DC
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Jul 2022 07:29:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.041 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	ONEWORD=2, RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7KppdlpibyKy for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Jul 2022 07:29:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B1154203A9
	for <nbd@other.debian.org>; Thu, 21 Jul 2022 07:29:43 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so703552pjf.2
        for <nbd@other.debian.org>; Thu, 21 Jul 2022 00:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=m7XQ41IePhgy7fFVDZYPzzUhNna6RuXomeiDwut1FJI=;
        b=YsT4BnN7SZGkjZQbJSvop8Sykp4x8xHvscm3xzyTjGQzyJL//Sxi0paCvmc4KSV73r
         1M/Vnh7vZrZeM/1bnFJ8QnFerUlT6wK0MLbf3DlqSUJinI2rRRza0+u4UYTQoxRsohf/
         pYROeYpm9Xa9VIem2XNtxo2WE2MP9sGIAGoV++NuLxMEm4cLRZLfPhV4I+D++r7T7aAl
         R+SlCtjjk6QecSkyg3pqMe95Zm9Llk83tr5BMoxPsbwhnTa8fNmNH76uVx/0Hqj323Pt
         Vo2aMIqrAROkeiKAYNUcTtcm/wvlbchmb2cizYMlSy9iDmknkNNuvNNgzmNHxXvTmHU9
         hJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=m7XQ41IePhgy7fFVDZYPzzUhNna6RuXomeiDwut1FJI=;
        b=lDeaBiA09c/s4lGGOxJqUQJbS5VXK70dGnz8gm5YQ1CNRbdBazvCVo6N5U5SNWlXV2
         NkjalaKms0Aant1hvSR4O8ocfqohouPwwAOgJhhXpr+z1yzQMLlojUcD5d0KVZwExOcq
         RtDWByyGX4my7IRYda/blW1FLFvKTdy8enp5hU45amN/vGFJTV5oesbGWgl1XKuAgxuY
         KGfEjtrgETQTSoOGad3FJVg6wHK+j7Q0TYdbFs1LOjsR0+IHvC0e4OttORDdYzd/ku4S
         fep+eTCXdZ1JkZT5v7T58EKK6ISB25DOjWabIAsaBn7LbRUQFNkw0lCeIdTHNydZBs8J
         wp3Q==
X-Gm-Message-State: AJIora9jEKhzKxx2EGlXAf2vepZXyfphBijdKZLMvrfTNY8bkKkDI3Ho
	/MjQMjbjeCgbyKOtUyBL63SyFufwgbT4EyM62mE=
X-Google-Smtp-Source: AGRyM1ucE+B01vmHN74gCYn4pW+LkIhjTxxKP1IKPvco+Amm1gqZY5TjB5kMfzldzqd7cHG/H1uTAT4B9pl/yF+aR/Q=
X-Received: by 2002:a17:902:db11:b0:16c:3e90:12e5 with SMTP id
 m17-20020a170902db1100b0016c3e9012e5mr42038150plx.73.1658388579439; Thu, 21
 Jul 2022 00:29:39 -0700 (PDT)
MIME-Version: 1.0
From: Jeff Williams <williamsjeff277@gmail.com>
Date: Thu, 21 Jul 2022 00:29:15 -0700
Message-ID: <CAJE-Q1sigw+LiB4hovz_6kC3TUU5t8SFUxMwXPaX-3Zy9oFBpA@mail.gmail.com>
Subject: HELLO
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002d591405e44bae5d"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <y-CZ5Vf9-0.A.QyF.GQQ2iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2197
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAJE-Q1sigw+LiB4hovz_6kC3TUU5t8SFUxMwXPaX-3Zy9oFBpA@mail.gmail.com
Resent-Date: Thu, 21 Jul 2022 07:45:10 +0000 (UTC)

--0000000000002d591405e44bae5d
Content-Type: text/plain; charset="UTF-8"

Did you receive my message to you today? Please let me know.

--0000000000002d591405e44bae5d
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Did you receive my message to you today? Please let me know.</div>

--0000000000002d591405e44bae5d--

