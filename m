Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B967CFE
	for <lists+nbd@lfdr.de>; Sun, 14 Jul 2019 06:24:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 49D2720534; Sun, 14 Jul 2019 04:24:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul 14 04:24:12 2019
Old-Return-Path: <marcos.souza.org@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D89662054C
	for <lists-other-nbd@bendel.debian.org>; Sun, 14 Jul 2019 04:08:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BsI-m8_lLAjK for <lists-other-nbd@bendel.debian.org>;
	Sun, 14 Jul 2019 04:08:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C883B20534
	for <nbd@other.debian.org>; Sun, 14 Jul 2019 04:08:43 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so12303807qtj.8
        for <nbd@other.debian.org>; Sat, 13 Jul 2019 21:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q5bbMBPu8QAd1DDh2cADphw/jDT31bG60vG8iZgXrVk=;
        b=Wlm86soP0owNkaS5D/15LRYAhA7T7WYP33N64+5GNF4ggiSev76ploSXSsaUVKPiPe
         2y6kpVrp9cg4DRoexaM0V5pN3rKhzwXnsQ/G3LQ/ioppJbFZ/31aZMX2hbBc0h6mdbi5
         vkhRb0+H8g0XqZX1jkELmfGK4/K+ofYco2jPv5TdtG7nZkKmNztF6cG7/bx3CupDlKgg
         8bQgLLWvOCQG2DyfGIP9yf1TsT3R4GEqjydbKe8YMqW9r5u3sf5LtmDm8IyS4/XUL1N7
         00jYvuI6zZQReaoBTlkEN4MNR/H0QZLGVIRsPiCITaiF64isvqesrAtPK7rVDyymdoao
         LqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q5bbMBPu8QAd1DDh2cADphw/jDT31bG60vG8iZgXrVk=;
        b=szOadZBhnrsYqHi3IZ2ZB01KVheJU5iz5uzhkC+qqospX2qTW8ncQP2oyy076aMcC/
         7KY8C84dJ0dxo7g1HzL7gAx/hReGaB91b2N340UaevMJovqFAec3joJ2SxttrkIoCM/i
         2GxYirVyrvK9r6mnqO8WOe1A1//oZzysZYz6qWlivLDm1XKawS7Dq/xyTcJHqswJs98Q
         8JiWhZy60WTAmoQj7zYEwo6v0g6vvm8BouRyciUtYp5r0vmo9Xetn3kyo3vuSm80qd4t
         E/f1w5zwxKMDebw2H+p4M0jBd+AWlGZHBXFItyLL41JK4dhOky74A/YtL8zz7pZ4edNZ
         2ghg==
X-Gm-Message-State: APjAAAXgNfuLA9OETMCIAgNNrNIdrr+HGLNgqxqwasVKzejZs6ATZHxs
	eJYhiWk014ls/rBmL0aF/iE=
X-Google-Smtp-Source: APXvYqwqfxx+wBlC74G4VcmDDci2R9i7mtSetOxLk5fCVm11o3/3IJ60HklV9E5IZDAN1v/W5XqEjA==
X-Received: by 2002:a0c:b163:: with SMTP id r32mr13628757qvc.169.1563077320621;
        Sat, 13 Jul 2019 21:08:40 -0700 (PDT)
Received: from continental ([191.35.237.35])
        by smtp.gmail.com with ESMTPSA id i23sm6181565qtm.17.2019.07.13.21.08.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 21:08:39 -0700 (PDT)
Date: Sun, 14 Jul 2019 01:09:33 -0300
From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	"open list:NETWORK BLOCK DEVICE (NBD)" <linux-block@vger.kernel.org>,
	"open list:NETWORK BLOCK DEVICE (NBD)" <nbd@other.debian.org>
Subject: Re: [PATCH] driver: block: nbd: Replace magic number 9 with
 SECTOR_SHIFT
Message-ID: <20190714040933.GB19237@continental>
References: <20190624160933.23148-1-marcos.souza.org@gmail.com>
 <20190702225521.GA16741@continental>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702225521.GA16741@continental>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mgYZph_bj2M.A.AtB.s5qKdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/601
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190714040933.GB19237@continental
Resent-Date: Sun, 14 Jul 2019 04:24:12 +0000 (UTC)

ping?

On Tue, Jul 02, 2019 at 07:55:21PM -0300, Marcos Paulo de Souza wrote:
> ping?
> 
> On Mon, Jun 24, 2019 at 01:09:33PM -0300, Marcos Paulo de Souza wrote:
> > set_capacity expects the disk size in sectors of 512 bytes, and changing
> > the magic number 9 to SECTOR_SHIFT clarifies this intent.
> > 
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> >  drivers/block/nbd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 3a9bca3aa093..fd3bc061c600 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -288,7 +288,7 @@ static void nbd_size_update(struct nbd_device *nbd)
> >  	}
> >  	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
> >  	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
> > -	set_capacity(nbd->disk, config->bytesize >> 9);
> > +	set_capacity(nbd->disk, config->bytesize >> SECTOR_SHIFT);
> >  	if (bdev) {
> >  		if (bdev->bd_disk) {
> >  			bd_set_size(bdev, config->bytesize);
> > -- 
> > 2.21.0
> > 

