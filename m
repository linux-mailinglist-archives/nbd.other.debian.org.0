Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F225A588
	for <lists+nbd@lfdr.de>; Wed,  2 Sep 2020 08:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CE2E9205C7; Wed,  2 Sep 2020 06:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  2 06:27:08 2020
Old-Return-Path: <song@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E2A24205AE
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Sep 2020 06:10:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BEfPPIh-e08A for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Sep 2020 06:10:30 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9459A205A0
	for <nbd@other.debian.org>; Wed,  2 Sep 2020 06:10:30 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5F4682087C
	for <nbd@other.debian.org>; Wed,  2 Sep 2020 06:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599026405;
	bh=qB+hJ64dFeZRc55gn05GV3vmMdd4XqXGRfV9RvpoPjM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=0qJu9pLJ4E1vrW1ZCOrx22K5hPkVXWi4ywQze2MMxFBe/K5cPfkOuOqBNt9LPwaDg
	 ZLrPaLIh81y83xpORfZ+dCgHhd49hoeXv9J8ZgsfKcp/G5G2kRmTyYl1K895tjJKXX
	 QjIDXFUXqjS0LTSdRPNSKdYJnpJZkVkN2EyBpTcg=
Received: by mail-lj1-f177.google.com with SMTP id k25so4377148ljg.9
        for <nbd@other.debian.org>; Tue, 01 Sep 2020 23:00:05 -0700 (PDT)
X-Gm-Message-State: AOAM5330s+yFZHAyIR83nm6j9fBw03/bgoSZAU7wCFG1vTTbhY7Ty6Lk
	BSclAYwKmtojp9wuxv+vl/xvPY6s30NQzrOmRYs=
X-Google-Smtp-Source: ABdhPJwf3HULiufgbpwKVoPwmf+LkIKFmte7J3KnU2uOXqQt3v5M5F/QoyNcLdziLtm9PrTb/1L0NAY4kWOOlCFV810=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr2427127lji.41.1599026403505;
 Tue, 01 Sep 2020 23:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200901155748.2884-1-hch@lst.de> <20200901155748.2884-10-hch@lst.de>
In-Reply-To: <20200901155748.2884-10-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 1 Sep 2020 22:59:52 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7YKTHsWnqv22gq6VEz29=abYk7ADsxcQr9q3_kGZuiXw@mail.gmail.com>
Message-ID: <CAPhsuW7YKTHsWnqv22gq6VEz29=abYk7ADsxcQr9q3_kGZuiXw@mail.gmail.com>
Subject: Re: [PATCH 9/9] block: remove revalidate_disk()
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Dan Williams <dan.j.williams@intel.com>, dm-devel@redhat.com, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-nvdimm@lists.01.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oVCQzhLOA6O.A.wiF.8szTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/974
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPhsuW7YKTHsWnqv22gq6VEz29=abYk7ADsxcQr9q3_kGZuiXw@mail.gmail.com
Resent-Date: Wed,  2 Sep 2020 06:27:08 +0000 (UTC)

On Tue, Sep 1, 2020 at 9:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Remove the now unused helper.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

