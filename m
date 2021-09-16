Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A310140D39A
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 09:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 610D92088A; Thu, 16 Sep 2021 07:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 07:12:09 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A2F95206B5
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 06:56:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dMPb3J4LMY29 for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 06:56:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 922F1206AA
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631775375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDYMLRQB5NY9ENd9cvkxCO0IUruGgbCum6Qchd6u8hw=;
	b=QNaEmbm3N8FCvhDeP4CspVAyAc+Wkm8Zj8uBKDWSVPLguC0cBMHp5tjNPyO7MyKoqKMVv7
	n24j7lF9rrZAlcE2V9E5Z9W8xc7PefY23Tx4M8lQecEFZ6J5lfOdup7rxYLTvaz/+fOHmI
	5mraVyhaOFlyZLRBY45bhi6dDUu7muM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-whdxxF9nPCyA1zqhoSsqCA-1; Thu, 16 Sep 2021 02:25:16 -0400
X-MC-Unique: whdxxF9nPCyA1zqhoSsqCA-1
Received: by mail-wr1-f70.google.com with SMTP id i16-20020adfded0000000b001572ebd528eso2001723wrn.19
        for <nbd@other.debian.org>; Wed, 15 Sep 2021 23:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YDYMLRQB5NY9ENd9cvkxCO0IUruGgbCum6Qchd6u8hw=;
        b=s/mGC+9XtU3ZwW9KyeI8/D18NdZA06K/icn1VbQf8JqWzG4LkzoCecOkVpNcgiNtqG
         T1RQ4M6THJ2gcHTnLxkl9Qi5boh7Sh4mYooFF/gJRE2ZBVWYacW2Pzv9+oj8LsCXbMjj
         p3iRh/ESrijWfpKI/Z090QKT8ROla2Rq23N1D1EXJtDabqyelNh2OHQpPO/AxW41umtV
         jgzFeJLHQ/Duvpfq2t9SM8cb4aJsFZLti//zN7IFftweslN39r2dIvcEJ0k5vcdWd06T
         sx84LqtmEWnOr0+aiyOJVXXaH6Oj3m+fy7VdUirWgaLnxXmhtExGgWATb6Dxsm++m4hS
         PdYg==
X-Gm-Message-State: AOAM531D19NEH0M/isYcm1mVrs3rmopaKNoD3/4WQQpyY5Z+SgVPz3X+
	NZTG7G1mAcOM7OuIi6kZ18Q0xTDOO/wQ11KtqlHV8j6wQeumMckoHdc2EQJ0v3F+ms8Y44+1Y2H
	0K4dG9Akj6kWZ1WvGqogGBnRXUWAxDQ==
X-Received: by 2002:a05:6000:11d1:: with SMTP id i17mr4125593wrx.424.1631773515394;
        Wed, 15 Sep 2021 23:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqTzrhsF/h6jSo+GRqZ3bg71kapWMBfrCU4g/DI13eBzKbIvKPTkQ38efTQNFa3EWEajYZ6DIZ1odcXcag90U=
X-Received: by 2002:a05:6000:11d1:: with SMTP id i17mr4125564wrx.424.1631773515148;
 Wed, 15 Sep 2021 23:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210806142914.70556-1-pkalever@redhat.com>
In-Reply-To: <20210806142914.70556-1-pkalever@redhat.com>
From: Prasanna Kalever <pkalever@redhat.com>
Date: Thu, 16 Sep 2021 11:55:04 +0530
Message-ID: <CANwsLLGYoexzyMkK5_0jpTA+P=_FS_UyudZSeTS=EZPjakYDpQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] nbd: reset the queue/io_timeout to default on disconnect
To: linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
	Ilya Dryomov <idryomov@redhat.com>, Xiubo Li <xiubli@redhat.com>, 
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkalever@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4iqp8yrfJvL.A._yF.J5uQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1485
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANwsLLGYoexzyMkK5_0jpTA+P=_FS_UyudZSeTS=EZPjakYDpQ@mail.gmail.com
Resent-Date: Thu, 16 Sep 2021 07:12:09 +0000 (UTC)

Hello,

Just wanted to bring this up again and remind you about the pending review.

Many Thanks,
--
Prasanna

On Fri, Aug 6, 2021 at 7:59 PM <pkalever@redhat.com> wrote:
>
> From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
>
> Hi,
>
> This series has changes to reset the queue/io_timeout for nbd devices and
> a cleanup patch.
>
> Thank you!
>
> Prasanna Kumar Kalever (2):
>   block: cleanup: define default command timeout and use it
>   nbd: reset the queue/io_timeout to default on disconnect
>
>  block/blk-mq.c         | 2 +-
>  drivers/block/nbd.c    | 9 +++++++--
>  include/linux/blkdev.h | 2 ++
>  3 files changed, 10 insertions(+), 3 deletions(-)
>
> --
> 2.31.1
>

