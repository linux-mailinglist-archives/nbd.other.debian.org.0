Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B88230CA3
	for <lists+nbd@lfdr.de>; Tue, 28 Jul 2020 16:45:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B04C5203DB; Tue, 28 Jul 2020 14:45:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 28 14:45:09 2020
Old-Return-Path: <mlevitsk@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG40 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B66E20439
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Jul 2020 14:28:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.558 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG40=0.637]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 40Y67BPcISQB for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Jul 2020 14:28:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id DB23720437
	for <nbd@other.debian.org>; Tue, 28 Jul 2020 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595946484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vk76CkPyZ5T42guo8MQRmFanU+aGvXip0+duA6MP1QY=;
	b=E2pBQjL4iMvgit8efOcYKJjaRS6k7ZKRaHjRpBOQQEj4RWJHNNbCOsLk3yZ05Xnxs8q99Q
	JuR1pCe94g+9VoYR3v30g3OnXKjSlrGKF51auqM8ENdf+E/GpvSpmj+TPWpHD3eCEmqndd
	E6N+ZeBC+0Vlxhl8WjuW9JRfSzgO4uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Jz4k5rM7NTirOgcPGnRijg-1; Tue, 28 Jul 2020 10:28:02 -0400
X-MC-Unique: Jz4k5rM7NTirOgcPGnRijg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80CAEE91C;
	Tue, 28 Jul 2020 14:27:58 +0000 (UTC)
Received: from fedora-32-enviroment (unknown [10.35.206.247])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA66F10013C4;
	Tue, 28 Jul 2020 14:27:42 +0000 (UTC)
Message-ID: <25011fed186bd8bfd1f25640158fbce60a7ad9ef.camel@redhat.com>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Christoph Hellwig
	 <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, Keith Busch <kbusch@kernel.org>, Josef
 Bacik <josef@toxicpanda.com>, "open list:BLOCK LAYER"
 <linux-block@vger.kernel.org>,  Sagi Grimberg <sagi@grimberg.me>, Jens
 Axboe <axboe@kernel.dk>, "open list:NVM EXPRESS DRIVER"
 <linux-nvme@lists.infradead.org>, "open list:SCSI CDROM DRIVER"
 <linux-scsi@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Bart Van Assche
 <bvanassche@acm.org>, Damien Le Moal <damien.lemoal@wdc.com>, Jason Wang
 <jasowang@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Ajay Joshi <ajay.joshi@wdc.com>, Ming
 Lei <ming.lei@redhat.com>, "open list:SONY MEMORYSTICK SUBSYSTEM"
 <linux-mmc@vger.kernel.org>, Satya Tangirala <satyat@google.com>, "open
 list:NETWORK BLOCK DEVICE (NBD)" <nbd@other.debian.org>, Hou Tao
 <houtao1@huawei.com>, Jens Axboe <axboe@fb.com>,  "open list:VIRTIO CORE
 AND NET DRIVERS" <virtualization@lists.linux-foundation.org>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Alex Dubov <oakad@yahoo.com>
Date: Tue, 28 Jul 2020 17:27:41 +0300
In-Reply-To: <f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
	 <20200721105239.8270-3-mlevitsk@redhat.com> <20200721151437.GB10620@lst.de>
	 <yq1zh7sfedj.fsf@ca-mkp.ca.oracle.com>
	 <f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xCjOKH62lX.A.4cD.1nDIfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/926
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/25011fed186bd8bfd1f25640158fbce60a7ad9ef.camel@redhat.com
Resent-Date: Tue, 28 Jul 2020 14:45:09 +0000 (UTC)

On Wed, 2020-07-22 at 12:11 +0300, Maxim Levitsky wrote:
> On Tue, 2020-07-21 at 22:55 -0400, Martin K. Petersen wrote:
> > Christoph,
> > 
> > > Hmm, I wonder if we should simply add the check and warning to
> > > blk_queue_logical_block_size and add an error in that case.  Then
> > > drivers only have to check the error return, which might add a lot
> > > less boiler plate code.
> > 
> > Yep, I agree.
> > 
> 
> I also agree that this would be cleaner (I actually tried to implement
> this the way you suggest), but let me explain my reasoning for doing
> it
> this way.
> 
> The problem is that most current users of blk_queue_logical_block_size
> (43 uses in the tree, out of which only 9 use constant block size)
> check
> for the block size relatively early, often store it in some internal
> struct etc, prior to calling blk_queue_logical_block_size thus making
> them only to rely on blk_queue_logical_block_size as the check for 
> block size validity will need non-trivial changes in their code.
> 
> Instead of this adding blk_is_valid_logical_block_size allowed me
> to trivially convert most of the uses.
> 
> For RFC I converted only some drivers that I am more familiar with
> and/or can test but I can remove the driver's own checks in most other
> drivers with low chance of introducing a bug, even if I can't test the
> driver.
> 
> What do you think?
> 
> I can also both make blk_queue_logical_block_size return an error
> value,
> and have blk_is_valid_logical_block_size and use either of these
> checks,
> depending on the driver with eventual goal of un-exporting
> blk_is_valid_logical_block_size.
> 
> Also note that I did add WARN_ON to blk_queue_logical_block_size.

Any update on this?

Best regards,
	Maxim Levitsky

> 
> Best regards,
> 	Maxim Levitsky

