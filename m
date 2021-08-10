Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 587093E5BE4
	for <lists+nbd@lfdr.de>; Tue, 10 Aug 2021 15:39:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 03781202A9; Tue, 10 Aug 2021 13:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 10 13:39:08 2021
Old-Return-Path: <immeublesourou@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,ONEWORD,RCVD_IN_DNSWL_NONE,
	TVD_PH_SUBJ_URGENT autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 70C7F2029D
	for <lists-other-nbd@bendel.debian.org>; Tue, 10 Aug 2021 13:21:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.801 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	ONEWORD=2, PYZOR_CHECK=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CGBceavceRoc for <lists-other-nbd@bendel.debian.org>;
	Tue, 10 Aug 2021 13:20:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DCBB12021D
	for <nbd@other.debian.org>; Tue, 10 Aug 2021 13:20:53 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id d20so9656664vso.8
        for <nbd@other.debian.org>; Tue, 10 Aug 2021 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=2tvLhkad0w+Mh63WhnFJkmRFgYsLXsJmUqGVjzUAFIo=;
        b=ZLiKrmHxm+0RpnFs548UQSGlnJ0IYtZsRHJHRlzsDnbhBjF9HsZvtCabjhSQoOTGqN
         UW0zCD/UM0Kp6aHuVqVHTo1lOoK3qs7mMIGp0T5AMnq7Ha+DC+dX1aNWU/Mlgn8VC83D
         8StTS/w3U8UjC7KeZOQVMUQcAVPvj8soy7hdPsg+gZ0piR/1ZhMyLhagLG2M3DkbBnM5
         MTzpscDAeHapCos77cclASkO19uAVc55CpNc0sVJlGhLgO2Up2GXg95i++LBglMQ2X49
         sMXhgseIrMBPlvhgzr3NUg0ceExsv2Zg9Ap/7rufRqeXTGeduCuQprCnPXiy58RWx4JF
         /1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=2tvLhkad0w+Mh63WhnFJkmRFgYsLXsJmUqGVjzUAFIo=;
        b=H/r2JQY7xf9RUYMtsKkmbp+xcmHi9zSwrfbBdiRsj7mg6C2BJxPdloCoom8AoKnPb1
         +hchl7DouUm13mrr0eqTc0MAowWCJkz9raEXqy+tO6dNlUIkfz+eN1K+uDvmNb1/TGuy
         mNDZWcleSmzCsYhm+UqM41c7Z7uBeFU072LPOUXpxbFRqw3QcoseC2BBdWazu/U7EnAn
         wcj+1DnXz+WCiasrwiKgxjiA3Ax3glEiAaYF/HIBKne+muQniVe8DO51l2ZGhyoHHzhK
         QM6htL+xQIPELBxunReI8+73pqSxWi5Tx39bzFcn+k8GhrE4kuBqI2yI/6U0IhUEvzOu
         WyQg==
X-Gm-Message-State: AOAM530b1MBBLwVxhPHNtQ9SsziOXB75IA6MY2FRGeWk6OyebHpKfalT
	j4Lpe9cG+7k1ffspMBfVtavJo1vbu8h+PAuK7Uo=
X-Google-Smtp-Source: ABdhPJyGGFKPlYVBYIkp2Fi8022J2wcSfHXo56eDrtYBYTSh/4uu2+vnKQkhV6jcjKFDrNlsyHIYJ42j913Zj682D0g=
X-Received: by 2002:a67:1c05:: with SMTP id c5mr21491931vsc.25.1628601650651;
 Tue, 10 Aug 2021 06:20:50 -0700 (PDT)
MIME-Version: 1.0
Sender: immeublesourou@gmail.com
Received: by 2002:ab0:3903:0:0:0:0:0 with HTTP; Tue, 10 Aug 2021 06:20:50
 -0700 (PDT)
From: John Kumor <owo219901@gmail.com>
Date: Wed, 11 Aug 2021 01:20:50 +1200
X-Google-Sender-Auth: AsqBD_WUz7VOsELMeo1Sz_4-Ix4
Message-ID: <CAHdg_cQugsfMGK96btnC9fmMNkKkW1L_SDUkEbyUi5U2Sq4ong@mail.gmail.com>
Subject: Urgent
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <r-gP2N3nAbP.A.f6C.8FoEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1261
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHdg_cQugsfMGK96btnC9fmMNkKkW1L_SDUkEbyUi5U2Sq4ong@mail.gmail.com
Resent-Date: Tue, 10 Aug 2021 13:39:09 +0000 (UTC)

My dear,
Greetings! I trust that all is well with you and your family. Did you
receive my previous email?
Regards
John Kumor.

