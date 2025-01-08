Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 03056A050E9
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 03:39:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DC16C2062C; Wed,  8 Jan 2025 02:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 02:39:09 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A691F20625
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 02:22:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.539 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6FCNOi_i97kg for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 02:22:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 3DC3B20628
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 02:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736302932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BUmFn0QdcbnrP+kAJCEAifsFmvKuEgoz5SMuFeJiqRM=;
	b=I3BR51AMiRBWDqx65nOjDIlwqp50x5rWfhL/XW1XMNZHXsxOrLOBG4dLUxRX+Td5Ly3cxD
	rztELj9Z2YYXKOQV826vvYAk1CYK7b/r7n5cfC4SmluTHje56v08VYS5SU6WtKafazwMQo
	w03iLSneMRV0TULxyLrJu0k0Z4TFUO4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-rFxU6K-JNFO5J-Hw5JdVVw-1; Tue,
 07 Jan 2025 21:22:07 -0500
X-MC-Unique: rFxU6K-JNFO5J-Hw5JdVVw-1
X-Mimecast-MFC-AGG-ID: rFxU6K-JNFO5J-Hw5JdVVw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D476919560BE;
	Wed,  8 Jan 2025 02:22:04 +0000 (UTC)
Received: from fedora (unknown [10.72.116.126])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E153D3000197;
	Wed,  8 Jan 2025 02:21:58 +0000 (UTC)
Date: Wed, 8 Jan 2025 10:21:53 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: fix queue freeze and limit locking order
Message-ID: <Z33hQfkbolsku7yr@fedora>
References: <20250107063120.1011593-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107063120.1011593-1-hch@lst.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Tvvw5rRAEQK.A.bqTG.NVefnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3269
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z33hQfkbolsku7yr@fedora
Resent-Date: Wed,  8 Jan 2025 02:39:09 +0000 (UTC)

On Tue, Jan 07, 2025 at 07:30:32AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this is my version of Damien's "Fix queue freeze and limit locking order".
> A lot looks very similar, but it was done independently based on the
> previous discussion.
> 
> Changes since RFC:
>  - fix a bizzare virtio_blk bisection snafu
>  - set BLK_FEAT_POLL a little less eagerly for blk-mq
>  - drop the loop patch just adding a comment
>  - improve various commit logs and coments
> 

loop_set_block_size() needs same change, can you cover it to this series?

Thanks,
Ming

