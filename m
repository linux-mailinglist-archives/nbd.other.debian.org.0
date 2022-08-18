Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58C598AC0
	for <lists+nbd@lfdr.de>; Thu, 18 Aug 2022 19:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 233A720473; Thu, 18 Aug 2022 17:57:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 18 17:57:12 2022
Old-Return-Path: <corbet@lwn.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 16EB920436
	for <lists-other-nbd@bendel.debian.org>; Thu, 18 Aug 2022 17:41:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.19 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, TO_TOO_MANY=1,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HaxYOA7voxwK for <lists-other-nbd@bendel.debian.org>;
	Thu, 18 Aug 2022 17:41:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 604 seconds by postgrey-1.36 at bendel; Thu, 18 Aug 2022 17:41:26 UTC
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 33C6D20433
	for <nbd@other.debian.org>; Thu, 18 Aug 2022 17:41:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B7ED9380;
	Thu, 18 Aug 2022 17:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7ED9380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1660843843; bh=HEzCVhd8Z2BaSgOGmYZqp8NQRsZGiSOk/f24cGVFZA0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Cu4PrKHrISuQtR4Z+aUOUHdoSUBTWj46jiAhbpc/e1qcrOGB2TCp1WSbddpwHdR2y
	 sA5P+Hj/kdZwqL7uxNzwSwqXz8s9AcyWFWUiamSJGnCUWn61FebBGNyKDa3tvAROoh
	 +vktDGGU4Q4vtGNRA2golm0yeTWhdun60affVrVDYoB9rFOKcmmSs8m3dO93L+dbDl
	 qwHXXudweyBTE9eFBJUOW+YTajRxn0xEf8wrLZ5dxo4Ub5oWY/h9A0037Fqy9JJmk+
	 HFog50idSwAVIe8KgZqGqWx9/iizZHpX0pchmJ2eWlDJu6BXEZQH6inZVP284X7DZw
	 UOofoa9AOQfvA==
From: Jonathan Corbet <corbet@lwn.net>
To: Manfred Spraul <manfred@colorfullife.com>, Federico Vaga
 <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>,
 linux-doc@vger.kernel.org
Cc: Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, Manfred Spraul
 <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH] Doc update: Correct magic values from nbd protocol, V2
In-Reply-To: <20220805082532.55131-1-manfred@colorfullife.com>
References: <20220805082532.55131-1-manfred@colorfullife.com>
Date: Thu, 18 Aug 2022 11:30:43 -0600
Message-ID: <87k075bgsc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oj4mN9sKetD.A.MYD.41n_iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2210
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/87k075bgsc.fsf@meer.lwn.net
Resent-Date: Thu, 18 Aug 2022 17:57:12 +0000 (UTC)

Manfred Spraul <manfred@colorfullife.com> writes:

> From: Manfred Spraul <manfred.spraul@de.bosch.com>
>
> The magic number documentation refers to old values for
> NBD_REQUEST_MAGIC and NBD_REPLY_MAGIC: The documented values were used
> until Linux 2.1.116pre2.
>
> Thus:
> - Update the documentation.
> - Update the header file: The authorative source for the nbd protocol
>   is proto.md from the nbd package, thus mention this.
> - Remove the historic values from the header file.
>   The historic values are still documented in proto.md from the nbd
>   package.
>
> Removing the historic values is intentional:
> The values are stale for > 20 years, and this was not noticed.
> My guess is that everyone used grep to confirm that the values are
> still in use - and the historic values resulted that there were
> still hits with grep, ...
>
> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
> Link: https://github.com/NetworkBlockDevice/nbd/commit/107356ee528eb30744d518a8ac1cb6d379da4868
> Link: https://lore.kernel.org/all/20220318200446.14648-1-manfred@colorfullife.com/
> Link: https://lists.debian.org/nbd/2022/01/msg00039.html
> ---
> V2:
> - more links added, especially a link to the commit for proto.md
> - typo corrected in the commit summary
>
> @Jonathan:
> I've created one patch that updates the English text and the 3 translations
> that contain magic-number.rst.
> Is this the right approach? I could also split the patch into 4 changes.

No, for something like this, it's fine to fix everything together.

Applied, thanks.

jon

