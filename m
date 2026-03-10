Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCnuDY9DsGlLhgIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 10 Mar 2026 17:15:11 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D68402546AF
	for <lists+nbd@lfdr.de>; Tue, 10 Mar 2026 17:15:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE99B20452; Tue, 10 Mar 2026 16:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 10 16:15:10 2026
Old-Return-Path: <csander@purestorage.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A0EF320440
	for <lists-other-nbd@bendel.debian.org>; Tue, 10 Mar 2026 15:57:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id l2D2g98Jd7PZ for <lists-other-nbd@bendel.debian.org>;
	Tue, 10 Mar 2026 15:57:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .purestorage. - helo: .mail-oa1-x35.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 33E0F20438
	for <nbd@other.debian.org>; Tue, 10 Mar 2026 15:57:03 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-40947c81b31so670366fac.1
        for <nbd@other.debian.org>; Tue, 10 Mar 2026 08:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773158220; cv=none;
        d=google.com; s=arc-20240605;
        b=IYX9FxvgHYHSx2RFZaXY9VT1VgVrhUQjwLGaXYR2Rj3xLe4CZuddnrAoMe7QGKKtna
         1NGArGBnZUFgFb1O1zVOvF2G6MViNy5b3vQljeD149rPqp2SqL+rOd0GM7Sq6GVPZwy+
         ST/xn5Fs0hQylmJw/ERfGqqgsMzdW7S8Sk9mGPFVr88OoaMk07b9nJMpRDVlSxXCPKkY
         59LrCTr7wtQM+TtzB1fLGJacr+R3mavY+0TnJBLat+/g2A2m614X4oN6cqGyyKONhBVl
         +Sf/7M3JmXagkhAYwC9mFddcromHdlHxGpGAdzSx7kcukY27Vbr0Qey7TRm4JnX+sSaF
         14TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        fh=VXeZOSILdA0Yg8jVfyLV0uvafTDYdotPSJ1dHQAChtw=;
        b=bl/5XhcSABYPMr67xM3M+udSEJYpuuWhcIM40xR0BhV+3IrfY5atSD/r3JwfeTrjKV
         kWhKagNaewjKAozsOIATKFmkqm2YkwAOdtX5wjVYISHP3vw5xzK0tg1tu7BEiN2MLfXX
         1pVZhdEad8Bdb4kk68GQt4brmZQrMVZTTAwaMy6zl/Nk1uIlN1Tn2osb3ARd2jQih+L5
         qi+dMcLvAA1U/Me8eWi6sqrQcE5ixt3x2Al+Zfn0xfJ+lU8ou1/caRQyFYEHznfYqm/0
         WAf5E5n6kNjFs+vSq1LtKB8CtyQgMJANYT3+wux9QvTB9t1OUyQoccpnVCyXgS89h2kz
         xolw==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773158220; x=1773763020; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=HA5F8HzRY+Tb3Ne9mhsp58E2amzs2pFEWdLYcAQbyCZwdN9E//R5SjOwGwYnfOm00K
         4SD0OuXK4qLzLw9vv8mwn8ohkFMtm4QMMUDA2iLn2XRXPgooNpDCc4mlAUNgBKuMYw5B
         FrnIb5ZUhENHYHyp4OC/O9Uq848voE1MxFXWGzKAF6pKp9L8lbCUG6Gu1VfNAJpjIPqR
         hovwnzdwjtfS6Kb40hHZ1xkP5qLmBXn0vxMuWDLUXyyqFvr8dBUzaCu7ReQDs6TwHUqZ
         gAx807ltN6GIxCjzDgwbKj3ZVckuPW3l2P0qggnMvCTVaLfsVwBDDKN5u/7OW+RU9ATo
         3gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158220; x=1773763020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=HZNlUdRha3P+DTEGwEpr2fAdGr6atNgN7YKpqIS3JY5LMrKT/pS17lkVEd1cjGOOhR
         b44cTrda6GvLOP847sf733gXySyTPDb/8P8Hz+QGKRkf8mFL3kujkTs1idTCBxhw6apR
         PZ/d/DIH71RNTAkSYCEvWrkrby8aSkW6TjtXe07igcfYCIIQasfA+/E3zd3LjRUxoFxg
         iC1EzM5hkD4hlXc088M6oxTUQJEBuRgkfBwcXzGF5umTnJta/2O34jZxjTCzZGbGmGMi
         g/k4KFkzyIoGUIKEF/0f310TJx3kBkQZRi0eFiOou9m5kLdfPqzR7Et/ec+mSE1Rhe3P
         J9tg==
X-Forwarded-Encrypted: i=1; AJvYcCWcoozZV5+DC3Yf0krS4b2w2+S/oUlRtNraQsbPUH5j3iW+KdxM3fcGtljGo/gf6AZ/tdA=@other.debian.org
X-Gm-Message-State: AOJu0YyVUgSaiEzD54ix+9T4ieZY+rjPq5nssdFVrQGrn3KEJKOpyGhs
	qE7nuJ+ulOP2QVlaNsfnXupfzRUNAYedMDOCv8HsVld3Hkgr/Td5EilzCOktmoiPJAyflulRL4t
	3e8/XCkft5gpfJFT8Q4CTG7+Pu6CVjo1afNFj8SAM+Q==
X-Gm-Gg: ATEYQzwu5HAHERBQqlhGEubz43xYebK+IrNjiKeOULEssMpNh+KYKP4/ZcN40Za2FIQ
	ahM4XbKoh0tR+K/aS9wb/RZDLgxoey6PLRf0u8+pxKLfuqDG0DjWRKJ6ccDGoKgMYw/mcnbXbyh
	9YVWdmMJIWeTZcqxopyipGxyfb5i8s5+ZgbcWz5LSl9y/vG+hvvrNOEmBniGXqSBcPVa/e0mGu2
	jJZYr4AQyriCXgPx+JuDXDTkstMOKQ6i9IWEzfFgbkZfnbO5KGfBt9w9wntB4ps0yJSlfm5I/0R
	n7WSdF/R
X-Received: by 2002:a05:6870:854b:b0:416:3f50:ea2 with SMTP id
 586e51a60fabf-416e45c1dc6mr7199342fac.8.1773158220092; Tue, 10 Mar 2026
 08:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
 <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
In-Reply-To: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 10 Mar 2026 08:56:48 -0700
X-Gm-Features: AaiRm52sHfM1lLReXhJ6K_-eQeuNMsoWbyv4AHit6rY5_ursGYcV9eDpU-ihUic
Message-ID: <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chao Shi <cshi008@fiu.edu>, 
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iit8YyCDEhC.A.PbbH.OOEspB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3514
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com
Resent-Date: Tue, 10 Mar 2026 16:15:10 +0000 (UTC)
X-Rspamd-Queue-Id: D68402546AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	INTRODUCTION(2.00)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[purestorage.com,quarantine];
	R_DKIM_ALLOW(-0.20)[purestorage.com:s=google2022];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:iam@sung-woo.kim,m:axboe@kernel.dk,m:josef@toxicpanda.com,m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:dm-devel@lists.linux.dev,m:ulf.hansson@linaro.org,m:richard@nod.at,m:miquel.raynal@bootlin.com,m:vigneshr@ti.com,m:marcan@marcan.st,m:sven@svenpeter.dev,m:alyssa@rosenzweig.io,m:kbusch@kernel.org,m:hch@lst.de,m:sagi@grimberg.me,m:james.smart@broadcom.com,m:kch@nvidia.com,m:jejb@linux.ibm.com,m:martin.petersen@oracle.com,m:cshi008@fiu.edu,m:weizhu@fiu.edu,m:daveti@purdue.edu,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:linux-mmc@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[csander@purestorage.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[csander@purestorage.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[purestorage.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sung-woo.kim:email,bendel.debian.org:rdns,bendel.debian.org:helo,purestorage.com:dkim,purestorage.com:email]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 4:55=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wrote=
:
>
> On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> =
wrote:
> > >
> > > The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> > > struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a result=
,
> > > numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx().
> >
> > The node argument to blk_mq_alloc_hctx() comes from
> > blk_mq_alloc_and_init_hctx(), which is called by
> > blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(set=
,
> > i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node()
> > doesn't find any CPU affinitized to the queue. Is that even possible?
>
> Thanks for your review, Celeb.

While I'm flattered you consider me a celebrity, my name is Caleb :)

>
> blk_mq_hw_queue_to_node() can return NUMA_NO_NODE if the device queues
> exceed the
> number of CPUs. Afterward, it is adjusted on the caller side to
> numa_node =3D set->numa_node.

I thought the NVMe driver capped the number of queues so every queue
is affinitized to some CPU (see nvme_max_io_queues()). What am I
missing?

Best,
Caleb

>
> set->numa_node can still be NUMA_NO_NODE if CONFIG_NUMA=3Dn (trivial) or
> pcibus_to_node() returns NUMA_NO_NODE if ACPI doesn't provide
> proximity information.
> But I'm not sure if this is usual in the real machines. We found the
> crash in QEMU.
>
> > >  static struct nvme_descriptor_pools *
> > > -nvme_setup_descriptor_pools(struct nvme_dev *dev, unsigned numa_node=
)
> > > +nvme_setup_descriptor_pools(struct nvme_dev *dev, int numa_node)
> > >  {
> > > -       struct nvme_descriptor_pools *pools =3D &dev->descriptor_pool=
s[numa_node];
> > > +       struct nvme_descriptor_pools *pools;
> > >         size_t small_align =3D NVME_SMALL_POOL_SIZE;
> > >
> > > +       if (numa_node =3D=3D NUMA_NO_NODE)
> > > +               pools =3D &dev->descriptor_pools[numa_node_id()];
> > > +       else
> > > +               pools =3D &dev->descriptor_pools[numa_node];
> >
> > Simpler: if (numa_node =3D=3D NUMA_NO_NODE) numa_node =3D numa_node_id(=
);
> >
>
> Thanks, I will modify it in V2.
>
> Sungwoo.

