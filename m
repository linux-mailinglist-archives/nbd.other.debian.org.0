Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B25F5032
	for <lists+nbd@lfdr.de>; Wed,  5 Oct 2022 09:12:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B2D3F203D8; Wed,  5 Oct 2022 07:12:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  5 07:12:11 2022
Old-Return-Path: <fthain@linux-m68k.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AEE81203B8
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Oct 2022 06:55:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.319 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OvRt1dIFC2fC for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Oct 2022 06:55:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linux-m68k. - helo: .wout1-smtp.messagingengine. - helo-domain: .messagingengine.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 57BC5203B9
	for <nbd@other.debian.org>; Wed,  5 Oct 2022 06:55:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D46F0320076F;
	Wed,  5 Oct 2022 02:54:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 05 Oct 2022 02:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664952897; x=1665039297; bh=jWTbZEvbtDtUpxhiaZ06jnKvT3cn
	t7nqR4YpnsdkpzA=; b=SN/B0rG//lwD0KUvExQeYgJmksgAuQTF3wbAMmkGYXw3
	tZDKhTSS0NxHUE/2Ljh3UjN1jVph4YVJNCa9EyI/k+wCFbArqwmSL7zuVXxEQvVi
	6BPctFK77GjmQwtk7oq5brX7C5oEDNKcjOhZ9omGjQffozknm0uLJGdA4Fpdc7+O
	td/p/33vN73l6G+g+1yZFfNlltEjDxBu5iRaz3KGHmhuUr8DVu9+eCj+6q9Y6g0N
	bDThAyvejofXn+tgNSPzqEjKpJejXW+D3uwo7Vp/M0MzzbGCxv99heIGcWEy5h2e
	glwIRnUzWyrOrshKeBlmMc/oubA/jYjr3y0mYPtyBw==
X-ME-Sender: <xms:Pyo9Y-Z4elN1Fe-Y2a5I_7wiI1rJYJUeIV3kNVkTTPhKeH1M5-vPwA>
    <xme:Pyo9YxY6wsMwCvFZLEPMRTXWojebDd1jhl7SQ-HfGakBHmmHIsBNCAM-QrjpNjlJS
    n9MLkASF-3dEhhAaTM>
X-ME-Received: <xmr:Pyo9Y4_XinFLEkKFqDfQkTqCnLPHtdInd6PX18SGuRvpMOawyGQ2i1yV8sHJ5MZSR1n_u-QBPC6BRl6VXUlKQWb6Xi9zpoLZ0dI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeivddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Pyo9YwqufxSZDLDkbx2_7_1aZI-PfVYfpBiX7qPsQYDRbF_Jstl4cg>
    <xmx:Pyo9Y5raNcqnWsqJdZpmQ_zJHhy3BoEiCgTYwzJt6WITb3rLAO3Alg>
    <xmx:Pyo9Y-QLMw58FfnDEeWlso5eW8V76Z0BdIwklzwU6U93vzJi8AlyUw>
    <xmx:QSo9Y_gAkX9CqBZ8zI3KIJAa8a0fZKASrx12ssz77auJ4vxMMkXv0Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 02:54:53 -0400 (EDT)
Date: Wed, 5 Oct 2022 17:54:48 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
cc: geert@linux-m68k.org, linux-block@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
    drbd-dev@lists.linbit.com, nbd@other.debian.org, 
    linux-mtd@lists.infradead.org, axboe@kernel.dk, philipp.reisner@linbit.com, 
    lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com, 
    efremov@linux.com, josef@toxicpanda.com, tim@cyberelk.net, 
    haris.iqbal@ionos.com, jinpu.wang@ionos.com, richard@nod.at, 
    miquel.raynal@bootlin.com, vigneshr@ti.com, mcgrof@kernel.org, 
    hare@suse.de, damien.lemoal@opensource.wdc.com, johannes.thumshirn@wdc.com, 
    bvanassche@acm.org, ming.lei@redhat.com, vincent.fu@samsung.com, 
    shinichiro.kawasaki@wdc.com
Subject: Re: [RFC PATCH 15/18] swim: use init disk helper
In-Reply-To: <20221005050027.39591-16-kch@nvidia.com>
Message-ID: <78eb3d46-de71-a20c-ed5a-efc6ce71f571@linux-m68k.org>
References: <20221005050027.39591-1-kch@nvidia.com> <20221005050027.39591-16-kch@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RliGd3rKwsM.A.hAG.L5SPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2229
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/78eb3d46-de71-a20c-ed5a-efc6ce71f571@linux-m68k.org
Resent-Date: Wed,  5 Oct 2022 07:12:11 +0000 (UTC)

On Tue, 4 Oct 2022, Chaitanya Kulkarni wrote:

> Add and use the helper to initialize the common fields of struct gendisk
> such as major, first_minor, minors, disk_name, private_data, and ops.
> This initialization is spread all over the block drivers. This avoids
> code repetation of inialization code of gendisk in current block drivers
> and any future ones.
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  drivers/block/swim.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/block/swim.c b/drivers/block/swim.c
> index 42b4b6828690..7fa4b2766367 100644
> --- a/drivers/block/swim.c
> +++ b/drivers/block/swim.c
> @@ -835,15 +835,12 @@ static int swim_floppy_init(struct swim_priv *swd)
>  
>  	for (drive = 0; drive < swd->floppy_count; drive++) {
>  		swd->unit[drive].disk->flags = GENHD_FL_REMOVABLE;
> -		swd->unit[drive].disk->major = FLOPPY_MAJOR;
> -		swd->unit[drive].disk->first_minor = drive;
> -		swd->unit[drive].disk->minors = 1;
>  		sprintf(swd->unit[drive].disk->disk_name, "fd%d", drive);
> -		swd->unit[drive].disk->fops = &floppy_fops;
>  		swd->unit[drive].disk->flags |= GENHD_FL_NO_PART;
>  		swd->unit[drive].disk->events = DISK_EVENT_MEDIA_CHANGE;
>  		swd->unit[drive].disk->private_data = &swd->unit[drive];
> -		set_capacity(swd->unit[drive].disk, 2880);
> +		init_disk(swd->unit[drive].disk, FLOPPY_MAJOR, drive, 1, 2880,
> +				&swd->unit[drive], &floopy_dops);
>  		err = add_disk(swd->unit[drive].disk);
>  		if (err)
>  			goto exit_put_disks;
> 

You typo'd the ops struct. By inspection, I'd say your patches 11/18 and 
16/18 will not compile either.

