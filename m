Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC730FB56
	for <lists+nbd@lfdr.de>; Thu,  4 Feb 2021 19:28:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 94DA5203F4; Thu,  4 Feb 2021 18:28:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  4 18:28:22 2021
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LDOSUBSCRIBER,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D798C20198
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 Feb 2021 18:28:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.878 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xUHQcw6Y9EYs for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 Feb 2021 18:28:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6B91520522
	for <nbd@other.debian.org>; Thu,  4 Feb 2021 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1612463276;
	bh=i3nTuK+pgvo/9QPBfT5WbS3MHtp7btA/9zpUQK9ksuY=;
	h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
	b=q/N0k5bKdreZ8tUr+EHwbCJSNa+NvXe+yTWSWsmNQWYwnSMcA2SHAd3v7fzakAlxw
	 SANl7ecZNpBZFL9IqpFVi+zjrflP0V0xj7QVgp+km0p7BfUq/r72lBcBVeGEFcf4Cc
	 HbpMEaC0DUAJD7LmjzGY4f0rSOpzNVTsVcgVaqEk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.112.112]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M7blv-1lu2Yd1jHD-00xGP5; Thu, 04
 Feb 2021 19:27:56 +0100
To: Sun Ke <sunke32@huawei.com>, Josef Bacik <josef@toxicpanda.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210204070910.1401239-1-sunke32@huawei.com>
 <20210204070910.1401239-3-sunke32@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v4 2/2] nbd: share exception handling code by goto put_nbd
Message-ID: <4f882b42-c72a-d6e6-fa94-0c60dfc20bb2@web.de>
Date: Thu, 4 Feb 2021 19:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204070910.1401239-3-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dXIHkowPb7oJKT17/9I6aHbcctDQkTrilCiJZN+unRQorz/4Hx7
 dST5RRs0tHMDuVm+ISVZMc44RJoTAvK5rRYmZuJxNDwjjatUsSKb0oeSp9Se4jg9ut71gPR
 C9SB6sT234JeAZjCKNxXohJjDUj0zvTS7yZbI8I/XEwaR1d2ehCRHS03BRpbRKpeBIz3ZaS
 vnd90Rv7ykhoSU8RpGqAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AX6it76jKFE=:L46l9vSTrFdrRmYJycDulm
 nu8E4GRL243Cln0/5J86vV8sP03OsQxv3VrZps+PO/KHMYazb0oASjamrYokIu2MmQvXtonTA
 e/fCLe1cInQVk479kvMHyYhW870zxdYLiNzdsgqUlKL+0Kr4ClvKVdf2H3HMDJWn6rxV0wCn1
 uN6V4LN+f2iQJmzbwXrK9l8sE23V+OOq/W1Ob4aUs+kDDA8V3dDQbBy9RsIs6KrLHRpsAkiHx
 Fgm2slrfATW0xWlZjEOP9BKrTin8p7QiqUtUhoF+vQggQKd+0xww3WlTzCLazRBIAXQCkEewC
 q9Tcnvf3UC7ufncNPRlx2z5pHnlfOFUGSRuSd3UTK+Q/hYD2lr4TVxjbXz8k1DySzLvxdbud2
 Lktmmgt94eJ4sTQrXhAxetDTCK1Bsi0wiVHUXCkiMf3dXN49ZPCv+PPAUchd8NR5eJL7eyedd
 wmUIvrj98MDtDyhziKvjW3ruRT0eA4BNRXVjeIq6L2GVYcHof4PoJCkNnc/AGFfB6tqQUPbem
 oadY6igKt76Xhv3FCL94Ncw0BefoEMeXrH5F/W3X8gSIFdHIogbpYFd+DhLm9Uc+lHRawXbRv
 HvSQB6h2VE/wqxYY2SlKJefZeDSpbaL2vzR5bU9fWSveq1GYfRw69XHWgTz+D3/8vX6G7PLF1
 xD5Tuxr6bw8mcOd8ffhAHIPlK2HH0vOU0Coy43LJoCB1Y/alidbh/P0Dzrq+qtNWoGUdGr2dl
 lQ1aVhwCnywhxi71RWXQabN7T4NdLBrlNM+18+fc1OgbocAtPFd+eFK5iF+HiK/CL0IQ140N0
 8ODJlK2M1FycYP5XtKxLJqG46x8ktKolSMKnTiVxF3MDW54uF71mYFF9iHUjIen39k6wO6LWB
 STwPEeBeyqDCWQjszfsg==
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YfrD3kHcHNH.A.sTD.GzDHgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1122
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4f882b42-c72a-d6e6-fa94-0c60dfc20bb2@web.de
Resent-Date: Thu,  4 Feb 2021 18:28:22 +0000 (UTC)

Is the term =E2=80=9Cexception handling=E2=80=9D really appropriate in thi=
s case
when the common statement =E2=80=9Creturn 0;=E2=80=9D might indicate a suc=
cessful function execution?

Regards,
Markus

