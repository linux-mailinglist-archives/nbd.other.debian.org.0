Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A143C078
	for <lists+nbd@lfdr.de>; Wed, 27 Oct 2021 05:00:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ADE39201D8; Wed, 27 Oct 2021 03:00:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 27 03:00:10 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E07EF20300
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 Oct 2021 02:42:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nnr6AqYMGZSv for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 Oct 2021 02:42:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 04B6B20340
	for <nbd@other.debian.org>; Wed, 27 Oct 2021 02:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635302535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GFlJ/1yKhFUIfKvLc15dlLwuXZ5oRP74dAa8t2k6+Q=;
	b=VfiTjyDpKlk+fvZQNoilPAf2uzWpKh0Byx4ue/ig2VMCvZjkh3cL3vxl6c0ENaC2UUA2u+
	qoceMoRku1r/T00UX7bejI9bbgwNMEsFXrD1YMPkWSmBoMtNuj8Yk5P2eDvFy8wTK0p3sq
	w0x62nUfQ9nWURkCMH9iWLtMA0GtAFw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Y2xoHGFVNg2zdE5YqieT-g-1; Tue, 26 Oct 2021 22:25:57 -0400
X-MC-Unique: Y2xoHGFVNg2zdE5YqieT-g-1
Received: by mail-lf1-f71.google.com with SMTP id t11-20020a056512068b00b003ffb571164dso638379lfe.14
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 19:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GFlJ/1yKhFUIfKvLc15dlLwuXZ5oRP74dAa8t2k6+Q=;
        b=xwqhVE0P3ogFilvyOzNn/C15iGO9MvFfJvl2sHt8Jz6TdqtgJho/LpbIcwXTpxeLeB
         E7i+IG9I/b9GSJsFDYkpAfRVJq+GEFQDmNycs0JHKcZUttdhlnYKMpEf6ypvr+9Szqj/
         OzBz3FHyTKgdcQHVqju4YutJJLFWM3RE1fAMDZgqpNCClZfQY3miqglOqBor28Jsg0Ye
         WHZcq3GEEO62eqdMtCI6hED/pzDKF0t3L10IO4fyRNUpQ3DPIlCGzWQHH6clRgRPmJSR
         9Zq93x6aDFcSYSilplF9MXWRQSQCzQT14VohEFqlWJSg8hJr26BDqpasBAF6eeBEHLCl
         tRGQ==
X-Gm-Message-State: AOAM532LWtfObM9FHAJ/WwTRKZssdNvpjPmTNWzfmQzyIwEM69vFfHhd
	Ymz86M3y8B+9c8/GTJ5vYIkKPMr5CzYy32W6taDvdfyPa2L1zgLiq94Mdnxo5P8xspk7OwLqJkf
	5SY7aQZzZu6mZZKt4l1JU+WAqHVyruw==
X-Received: by 2002:a2e:9bd0:: with SMTP id w16mr30330445ljj.390.1635301556302;
        Tue, 26 Oct 2021 19:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQdnnd/xWCIZeeT9sZ/haOAoAxaIqIaaCuSXpSmlcCRhwKiVY87HUDouxpPgrTwnPJdBUj/W/7upQh+L04WTI=
X-Received: by 2002:a2e:9bd0:: with SMTP id w16mr30330429ljj.390.1635301556076;
 Tue, 26 Oct 2021 19:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210806142914.70556-1-pkalever@redhat.com> <20210806142914.70556-3-pkalever@redhat.com>
 <YUL/DGZiUnQQGHVX@T590>
In-Reply-To: <YUL/DGZiUnQQGHVX@T590>
From: Prasanna Kalever <pkalever@redhat.com>
Date: Wed, 27 Oct 2021 07:55:44 +0530
Message-ID: <CANwsLLG0WuD4ZGZv_DX3AZtQMrHX1Az-aNvFY0DK6R+UxVwu8w@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] nbd: reset the queue/io_timeout to default on disconnect
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org
Cc: Ilya Dryomov <idryomov@redhat.com>, Xiubo Li <xiubli@redhat.com>, 
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>, Ming Lei <ming.lei@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkalever@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2IXyKdcWewM.A.x_C.6CMehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1584
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANwsLLG0WuD4ZGZv_DX3AZtQMrHX1Az-aNvFY0DK6R+UxVwu8w@mail.gmail.com
Resent-Date: Wed, 27 Oct 2021 03:00:10 +0000 (UTC)

On Thu, Sep 16, 2021 at 1:53 PM Ming Lei <ming.lei@redhat.com> wrote:
>
> On Fri, Aug 06, 2021 at 07:59:14PM +0530, pkalever@redhat.com wrote:
> > From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> >
> > Without any changes to NBD_ATTR_TIMEOUT (default is 30 secs),
> > $ rbd-nbd map rbd-pool/image0 --try-netlink
> > /dev/nbd0
> > $ cat /sys/block/nbd0/queue/io_timeout
> > 30000
> > $ rbd-nbd unmap /dev/nbd0
> > $ cat /sys/block/nbd0/queue/io_timeout
> > 30000
> >
> > Now user sets NBD_ATTR_TIMEOUT to 60,
> > $ rbd-nbd map rbd-pool/image0 --try-netlink --io-timeout 60
> > /dev/nbd0
> > $ cat /sys/block/nbd0/queue/io_timeout
> > 60000
> > $ rbd-nbd unmap /dev/nbd0
> > $ cat /sys/block/nbd0/queue/io_timeout
> > 60000
> >
> > Now user doesn't alter NBD_ATTR_TIMEOUT, but sysfs still shows it as 60,
> > $ rbd-nbd map rbd-pool/image0 --try-netlink
> > /dev/nbd0
> > $ cat /sys/block/nbd0/queue/io_timeout
> > 60000
> > $ rbd-nbd unmap /dev/nbd0
> > $ cat /sys/block/nbd0/queue/io_timeout
> > 60000
> >
> > The problem exists with ioctl interface too.
> >
> > Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> > ---
> >  drivers/block/nbd.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 16a1a14b1fd1..a45aabc4914b 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -158,6 +158,7 @@ static void nbd_connect_reply(struct genl_info *info, int index);
> >  static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info);
> >  static void nbd_dead_link_work(struct work_struct *work);
> >  static void nbd_disconnect_and_put(struct nbd_device *nbd);
> > +static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout);
> >
> >  static inline struct device *nbd_to_dev(struct nbd_device *nbd)
> >  {
> > @@ -1250,7 +1251,7 @@ static void nbd_config_put(struct nbd_device *nbd)
> >                       destroy_workqueue(nbd->recv_workq);
> >               nbd->recv_workq = NULL;
> >
> > -             nbd->tag_set.timeout = 0;
> > +             nbd_set_cmd_timeout(nbd, 0);
> >               nbd->disk->queue->limits.discard_granularity = 0;
> >               nbd->disk->queue->limits.discard_alignment = 0;
> >               blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
> > @@ -2124,6 +2125,10 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
> >       if (ret)
> >               goto out;
> >
> > +     /*
> > +      * On reconfigure, if NBD_ATTR_TIMEOUT is not provided, we will
> > +      * continue to use the cmd timeout provided with connect initially.
> > +      */
> >       if (info->attrs[NBD_ATTR_TIMEOUT])
> >               nbd_set_cmd_timeout(nbd,
> >                                   nla_get_u64(info->attrs[NBD_ATTR_TIMEOUT]));
> > --
> > 2.31.1
> >
>
> Looks fine:
>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks for the review Ming.
Attempting to bring this to the top again for more reviews/acks.


Thanks!
--
Prasanna


>
> --
> Ming
>

