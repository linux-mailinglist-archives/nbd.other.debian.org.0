Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D85D856
	for <lists+nbd@lfdr.de>; Wed,  3 Jul 2019 01:12:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F8BC2065B; Tue,  2 Jul 2019 23:12:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  2 23:12:08 2019
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
	by bendel.debian.org (Postfix) with ESMTP id D8573205EE
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Jul 2019 22:54:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UgKNsYTQjEIw for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Jul 2019 22:54:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F3ACA2065E
	for <nbd@other.debian.org>; Tue,  2 Jul 2019 22:54:43 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f25so115196pgv.10
        for <nbd@other.debian.org>; Tue, 02 Jul 2019 15:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hOIwG5g5qmRLAvMNTG4avtQVbsGFIvybNsnInhl+M4o=;
        b=cb/Pk1At+z3oGkj9asXbRIPTNhtNNDhEo9ERURh8nDXjg9YfPprqQ0qQYHqhy6rSaF
         JJspKzFbPkoHBG1kaQbIKL4Etz6H7aOfya+lfGpEAx6RnbpVdTd7Rxs7T0tbO5UisAdO
         ZPS+HcJG5yjLZ5ZwaiZd06fGxx/3MPhHrBdRynVocTY4ZZQqWSgJAGtpgAcK2EM1t/IC
         ql85Jt+6SJaTpykfV7iCWdY664TUtO6aseDda3Coj6ovwBG5auhQYjx2CnWoovXC0vYV
         TGVurkVhHPuRr2MoDJiWpkQUxDkKogeLnLOiv6z74HHdSogerj7IJhsi3buT9J7QMe6q
         XOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hOIwG5g5qmRLAvMNTG4avtQVbsGFIvybNsnInhl+M4o=;
        b=HE39cDi/qgYVtipeCulplNqmFh1nRY5bioERcizIEgX1eHBXYiTmjM0m2O8TiucUbP
         HJs9dhy2NTma8O93iEKkhzMzJgaapWabxLjR8kZcqQfzl/LyL2ozAXv+Aq0i+QUs066z
         mvMc0Bo+S9VEiNp+iWtPnR/vUXCRvQylAe4B7OmCy5/F3zRo0eBhxQ0Zt9GRiKL93kxL
         hYTT2o/dhWqcke5mApPHS7duNQ7ijZXgCgP/51KKxiHIPNJIlmnuWs2ApfsNZc7LlvGf
         wJFzHfBnpXyhL48pnEyoArrRWidAYBs75egvdh5IANWM+iQQPXdYE1IUfjyPQJgQAZZB
         JzoA==
X-Gm-Message-State: APjAAAVP3hyJtfKowZs8DuSJFlti05oiuhHiLImNa6dG8rB+V/vfeApr
	85rQb7n70vVL1mA6I9DChzo=
X-Google-Smtp-Source: APXvYqz77rLbSyHhgcZyWseydKse1/eh4HWO31E2oh1XmlIvsC+gQNegzx8lDeCvxQG38H30v200vA==
X-Received: by 2002:a17:90a:2768:: with SMTP id o95mr8287011pje.37.1562108080227;
        Tue, 02 Jul 2019 15:54:40 -0700 (PDT)
Received: from continental ([189.58.144.164])
        by smtp.gmail.com with ESMTPSA id k14sm135388pfg.6.2019.07.02.15.54.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 15:54:39 -0700 (PDT)
Date: Tue, 2 Jul 2019 19:55:21 -0300
From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	"open list:NETWORK BLOCK DEVICE (NBD)" <linux-block@vger.kernel.org>,
	"open list:NETWORK BLOCK DEVICE (NBD)" <nbd@other.debian.org>,
	marcos.souza.org@gmail.com
Subject: Re: [PATCH] driver: block: nbd: Replace magic number 9 with
 SECTOR_SHIFT
Message-ID: <20190702225521.GA16741@continental>
References: <20190624160933.23148-1-marcos.souza.org@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624160933.23148-1-marcos.souza.org@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V30hFthzNOK.A.F1B.IT-GdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/600
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190702225521.GA16741@continental
Resent-Date: Tue,  2 Jul 2019 23:12:08 +0000 (UTC)

ping?

On Mon, Jun 24, 2019 at 01:09:33PM -0300, Marcos Paulo de Souza wrote:
> set_capacity expects the disk size in sectors of 512 bytes, and changing
> the magic number 9 to SECTOR_SHIFT clarifies this intent.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  drivers/block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 3a9bca3aa093..fd3bc061c600 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -288,7 +288,7 @@ static void nbd_size_update(struct nbd_device *nbd)
>  	}
>  	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
>  	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
> -	set_capacity(nbd->disk, config->bytesize >> 9);
> +	set_capacity(nbd->disk, config->bytesize >> SECTOR_SHIFT);
>  	if (bdev) {
>  		if (bdev->bd_disk) {
>  			bd_set_size(bdev, config->bytesize);
> -- 
> 2.21.0
> 

