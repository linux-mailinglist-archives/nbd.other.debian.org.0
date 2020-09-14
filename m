Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CC269154
	for <lists+nbd@lfdr.de>; Mon, 14 Sep 2020 18:21:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 49FD020195; Mon, 14 Sep 2020 16:21:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 14 16:21:33 2020
Old-Return-Path: <gregorhaas1997@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 72DD920125
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Sep 2020 16:03:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RninqRs-X45V for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Sep 2020 16:03:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 86C0820133
	for <nbd@other.debian.org>; Mon, 14 Sep 2020 16:03:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gr14so781629ejb.1
        for <nbd@other.debian.org>; Mon, 14 Sep 2020 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ytm233Js0GIpXiya2bQURt5D0novjsojirU/MOm0Zw4=;
        b=Wgi7YoZRIFFZDbx8qbE6tcS1LJzvP9mFDzjxr3yHsHj9v6Q6ETIsYT9aCEyCGwLzMG
         bc0lRUP8FhGWhAyzaiOdLsq82wE4Kw48RJPd33z7A1N00ncqTzBZUU3vsJN45x5jOcnN
         aFtvdtdGtLafv5AG4J0BKyuPVXchY8xRrGm1tviy20HgV+f57BR7wBjmKi0PjAWfQFIK
         z77tZmBxIoOLTQdOtU6LJ8VwzNEpvhVqEg2mtgrbIabC0NtcFUTk3cRuWOcbBWA0n0u3
         odAjDKnJjaoYSP73tEQMApQo4aKRs4LoCIcOo7O36hn5Dqs8C/pwsMpoGaGHApSOjD37
         QMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ytm233Js0GIpXiya2bQURt5D0novjsojirU/MOm0Zw4=;
        b=d5xf3ZQYaCG5dW3D7vXvLyDjSHgpMyxI37Tk13OwUDgyk8k56ioiAe4a+vJLP2LcJd
         RrWQSAi0xPJoC/pAeOtLj8bN8fswfQivI2YV+Y2sCAs0UKnxFdNG0he+vvUlhcQ2WOrB
         EhAuO667lhxFLDtDf3ueVmnZT7lzK02LWwDsURDS1m6cAn9daEVrc5V0cr1+Z+HksneY
         88TOhbj1Kqv9YVVm20+edB/9j4vJI0gzo0Xf7YlR42kpSDcAg23FyKOfFW7qHs1naxOI
         oqoxqs18YVVpizhve72Gp1ce8pT0VaZFCYh6AhpMs8fGga1ThBlkuY7hWOUs7ruD3sqi
         rGyg==
X-Gm-Message-State: AOAM53249imliriyvkBy+P8ijGCxVf0Qq0OZ8rTNlVTijn/3PErZV6E9
	RsOAPW+2dIUDBCRDmnMhNAxDyEm/Ck6fwQtf6RKUWam3xDi8sg==
X-Google-Smtp-Source: ABdhPJzZiuc6/fEtGdDVDSmxnAgytKeDDh24VnPAA3XcDH1q7GrTaEPjh4S4ugpJcMLGEEafS5UB7TuwpfD6wb5RbJw=
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr15160324ejn.542.1600099425310;
 Mon, 14 Sep 2020 09:03:45 -0700 (PDT)
MIME-Version: 1.0
From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Mon, 14 Sep 2020 12:03:08 -0400
Message-ID: <CAMqWt3oixWoLuHUUxeRZDPAJGoF_M0sOZtVNfbiaaSq8KxjN0g@mail.gmail.com>
Subject: Mounting from multiple devices
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="000000000000d9dc9305af482da4"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wuAkRgZdNkJ.A.-cC.Ni5XfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/977
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMqWt3oixWoLuHUUxeRZDPAJGoF_M0sOZtVNfbiaaSq8KxjN0g@mail.gmail.com
Resent-Date: Mon, 14 Sep 2020 16:21:33 +0000 (UTC)

--000000000000d9dc9305af482da4
Content-Type: text/plain; charset="UTF-8"

Hi all,

First off, thank you for developing NBD. I've really been enjoying using it
recently - accessing raw block devices over a network fits very well into
my various use cases.

However, I've found some conflicting documentation about the _safety_ of
accessing an exported block device from multiple clients. Notably, the
sourceforge page (https://nbd.sourceforge.io/) states that "if someone has
mounted NBD read/write, you must assure that no one else will have it
mounted". In contrast, the documentation in the current Linux tree (
https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/blockdev/nbd.rst)
does omits this sentence, implying that it is okay for multiple clients to
mount NBD read/write.

Let's say I have an ext4 filesystem on an NBD. Is it safe for me to mount
this filesystem on multiple clients?

Thank you,
Gregor Haas

--000000000000d9dc9305af482da4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>First off, thank you for develo=
ping NBD. I&#39;ve really been enjoying using it recently - accessing raw b=
lock devices over a network fits very well into my various use cases.</div>=
<div><br></div><div>However, I&#39;ve found some conflicting documentation =
about the _safety_ of accessing an exported block device from multiple clie=
nts. Notably, the sourceforge page (<a href=3D"https://nbd.sourceforge.io/"=
>https://nbd.sourceforge.io/</a>) states that &quot;if someone has mounted =
NBD read/write, you must assure that no one else will have it mounted&quot;=
. In contrast, the documentation in the current Linux tree (<a href=3D"http=
s://github.com/torvalds/linux/blob/master/Documentation/admin-guide/blockde=
v/nbd.rst">https://github.com/torvalds/linux/blob/master/Documentation/admi=
n-guide/blockdev/nbd.rst</a>) does omits this sentence, implying that it is=
 okay for multiple clients to mount NBD read/write.</div><div><br></div><di=
v>Let&#39;s say I have an ext4 filesystem on an NBD. Is it safe for me to m=
ount this filesystem on multiple clients?</div><div><br></div><div>Thank yo=
u,</div><div>Gregor Haas</div></div>

--000000000000d9dc9305af482da4--

