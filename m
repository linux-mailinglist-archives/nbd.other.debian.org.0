Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B45F5231
	for <lists+nbd@lfdr.de>; Wed,  5 Oct 2022 12:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CA50820510; Wed,  5 Oct 2022 10:06:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  5 10:06:26 2022
Old-Return-Path: <ulf.hansson@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C6207204FF
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Oct 2022 09:48:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id F2tqg6YT-cuG for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Oct 2022 09:48:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linaro. - helo: .mail-pj1-x1036.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4AE5E20501
	for <nbd@other.debian.org>; Wed,  5 Oct 2022 09:48:14 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so1131285pjq.3
        for <nbd@other.debian.org>; Wed, 05 Oct 2022 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uAiOjs73GnPtRWDKlCBYpOmHeG3ElDSPTXYVbLmJn3Y=;
        b=dh/s9gbrJ1NP2il6j7m7392rb5m/0olUhLw6ywfYrwbm+b05mgthbXGVeHCne6faSe
         nEB8FWIww9/Mh3TPJYBTwQxHk9YQhBfOYEWSgISGS3x2V+1PSzpPW0fGwHCNvRUrDmsC
         V4LPjNBP1ZNWd2lWycmQ+cVlk2hOYpk0wbD3BQW90ktRdTfHVQoOGdzFfsVLA+UV8P0L
         yaYjHeb70WMgWdHpn0iX5L8LgNN78O1ThcYXr+GHqSaFRNBAWLFYqLr8IpSUK6wbVOaM
         BO7XUtm7Hdl6sqI52mxM7YweUuOKwjFV07IZc9k6gah2y9PsEzpdZlxqQ3TbFVT9xR+n
         gOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uAiOjs73GnPtRWDKlCBYpOmHeG3ElDSPTXYVbLmJn3Y=;
        b=tV+WH6AHmUfkVQ1krnGu8H1Y2WED3N92A9eL3qq8ef+oHiPE0kZQ1HAkzqRk1f239N
         0/eOxKG+w0k4bIEGsR9jd1oVPZfZLzpaYNCQm2xMHmbUuoberUnvJml5cXkX/hZ+sOm+
         Xk3HfHvSUFg/dL7ySlDC8qzRbfoWzCAguCpmOoD3RG9PYxxJI2+FG3ucTOlRvi0KutPH
         QQsx9vD0QLTmDVEHzXUnEmalwl5KPdR5+JpwPTLKBWYpD+lf8XqWk/pAMfByxm7xjDSH
         tpfLVLSXYPJmc2WmKOXigkNGerhCUyBXoz96HEwrPDOyI6k4KdbjMg8WaWCMXIugqFe6
         6u5A==
X-Gm-Message-State: ACrzQf3xeTq+teWsFOQ/U8qv+oQk8tn2EA7UH3dXPZUNKW+I8DWsMH4U
	LfiJ5UpHCE3D1yBYKw2bI10ktTTrcDxL0M1AY1IfGw==
X-Google-Smtp-Source: AMsMyM6eqXlNc1atZOkkKgiG1yV3Y78Coz+AbzCXphLyt0GPdUFcokJxxEDnXeFGnrVe0bHv3fHf9rWqZFSPgK8TTJI=
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr4350723pjb.164.1664963290949; Wed, 05
 Oct 2022 02:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221005032257.80681-1-kch@nvidia.com> <20221005032257.80681-2-kch@nvidia.com>
 <6fee2d7a-7fd1-73ee-2911-87a4ed3e8769@opensource.wdc.com>
In-Reply-To: <6fee2d7a-7fd1-73ee-2911-87a4ed3e8769@opensource.wdc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Oct 2022 11:47:34 +0200
Message-ID: <CAPDyKFpBpiydQn+=24CqtaH_qa3tQfN2gQSiUrHCjnLSuy4=Kg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/21] block: add and use init tagset helper
To: Chaitanya Kulkarni <kch@nvidia.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, axboe@kernel.dk, 
	efremov@linux.com, josef@toxicpanda.com, idryomov@gmail.com, 
	dongsheng.yang@easystack.cn, haris.iqbal@ionos.com, jinpu.wang@ionos.com, 
	mst@redhat.com, jasowang@redhat.com, pbonzini@redhat.com, stefanha@redhat.com, 
	ohad@wizery.com, andersson@kernel.org, baolin.wang@linux.alibaba.com, 
	richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com, marcan@marcan.st, 
	sven@svenpeter.dev, alyssa@rosenzweig.io, kbusch@kernel.org, hch@lst.de, 
	sagi@grimberg.me, sth@linux.ibm.com, hoeppner@linux.ibm.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, hare@suse.de, bhelgaas@google.com, 
	john.garry@huawei.com, mcgrof@kernel.org, christophe.jaillet@wanadoo.fr, 
	vaibhavgupta40@gmail.com, wsa+renesas@sang-engineering.com, 
	johannes.thumshirn@wdc.com, bvanassche@acm.org, ming.lei@redhat.com, 
	shinichiro.kawasaki@wdc.com, vincent.fu@samsung.com, 
	christoph.boehmwalder@linbit.com, joel@jms.id.au, vincent.whitchurch@axis.com, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QD1hVsVJBDL.A.5YB.icVPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2230
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPDyKFpBpiydQn+=24CqtaH_qa3tQfN2gQSiUrHCjnLSuy4=Kg@mail.gmail.com
Resent-Date: Wed,  5 Oct 2022 10:06:26 +0000 (UTC)

On Wed, 5 Oct 2022 at 07:11, Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 10/5/22 12:22, Chaitanya Kulkarni wrote:
> > Add and use the helper to initialize the common fields of the tag_set
> > such as blk_mq_ops, number of h/w queues, queue depth, command size,
> > numa_node, timeout, BLK_MQ_F_XXX flags, driver data. This initialization
> > is spread all over the block drivers. This avoids the code repetation of
> > the inialization code of the tag set in current block drivers and any
>
> s/inialization/initialization
> s/repetation/repetition
>
> > future ones.
> >
> > Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> > ---
> >  block/blk-mq.c                | 20 ++++++++++++++++++++
> >  drivers/block/null_blk/main.c | 10 +++-------
> >  include/linux/blk-mq.h        |  5 +++++
> >  3 files changed, 28 insertions(+), 7 deletions(-)
> >
> > diff --git a/block/blk-mq.c b/block/blk-mq.c
> > index 8070b6c10e8d..e3a8dd81bbe2 100644
> > --- a/block/blk-mq.c
> > +++ b/block/blk-mq.c
> > @@ -4341,6 +4341,26 @@ static int blk_mq_alloc_tag_set_tags(struct blk_mq_tag_set *set,
> >       return blk_mq_realloc_tag_set_tags(set, 0, new_nr_hw_queues);
> >  }
> >
> > +void blk_mq_init_tag_set(struct blk_mq_tag_set *set,
> > +             const struct blk_mq_ops *ops, unsigned int nr_hw_queues,
> > +             unsigned int queue_depth, unsigned int cmd_size, int numa_node,
> > +             unsigned int timeout, unsigned int flags, void *driver_data)
>
> That is an awful lot of arguments... I would be tempted to say pack all
> these into a struct but then that would kind of negate this patchset goal.
> Using a function with that many arguments will be error prone, and hard to
> review... Not a fan.

I completely agree.

But there is also another problem going down this route. If/when we
realize that there is another parameter needed in the blk_mq_tag_set.
Today that's quite easy to add (assuming the parameter can be
optional), without changing the blk_mq_init_tag_set() interface.

>
> > +{
> > +     if (!set)
> > +             return;
> > +
> > +     set->ops = ops;
> > +     set->nr_hw_queues = nr_hw_queues;
> > +     set->queue_depth = queue_depth;
> > +     set->cmd_size = cmd_size;
> > +     set->numa_node = numa_node;
> > +     set->timeout = timeout;
> > +     set->flags = flags;
> > +     set->driver_data = driver_data;
> > +}
> > +
>

[...]

Kind regards
Uffe

