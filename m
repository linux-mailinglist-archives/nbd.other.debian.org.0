Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96F9EFB5C
	for <lists+nbd@lfdr.de>; Thu, 12 Dec 2024 19:46:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0DEB220478; Thu, 12 Dec 2024 18:46:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 12 18:46:35 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SARE_MSGID_LONG45,SARE_MSGID_LONG50
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9054720473
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Dec 2024 18:46:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MycLOP-cTRKv for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Dec 2024 18:46:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 0EC4420466
	for <nbd@other.debian.org>; Thu, 12 Dec 2024 18:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734029175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74W5Irscxrpk+2qt7DTQlZRQLZsbatGrWvH67U/YKms=;
	b=bnIDBrE2Oy8NkOV+Fy2pgQ1lJjxTjzBpRl/kx5Ge2Ao3ofMfgcU8qpiMTp3kj+QAzIjv2k
	7VtULWQ2XfD58Wu6R4gWsOhk0Txn9yB0LNHOuw5cvoYCb2R1dop0CRJC4Ah85BHa3+qY+c
	f1ZgGhYoku0pyzRaMvLIUtfEaRsNZu4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-Y8mog8apP9C5vnWaQjhTbA-1; Thu,
 12 Dec 2024 13:46:13 -0500
X-MC-Unique: Y8mog8apP9C5vnWaQjhTbA-1
X-Mimecast-MFC-AGG-ID: Y8mog8apP9C5vnWaQjhTbA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDF8C1956050;
	Thu, 12 Dec 2024 18:46:12 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.81])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 912A1195605A;
	Thu, 12 Dec 2024 18:46:11 +0000 (UTC)
Date: Thu, 12 Dec 2024 12:46:09 -0600
From: Eric Blake <eblake@redhat.com>
To: Connor Kuehl <cipkuehl@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: question on NBD idempotency
Message-ID: <tsk6rlk53nlpv5a2d6b2yf4ivzwurcqhhkjqxy7vlc5saycef4@4edin4p2u5e4>
References: <2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih>
 <89dfc797-b4ab-42d0-b624-7e88a255cfd5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <89dfc797-b4ab-42d0-b624-7e88a255cfd5@gmail.com>
User-Agent: NeoMutt/20241114
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FjKmCsSbGeOX57yqDh9sa4AUGYh-S-ZUAeNqnGRbgKw_1734029173
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TqDYZ6yJqIJ.A.UdfB.K-yWnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3199
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/tsk6rlk53nlpv5a2d6b2yf4ivzwurcqhhkjqxy7vlc5saycef4@4edin4p2u5e4
Resent-Date: Thu, 12 Dec 2024 18:46:35 +0000 (UTC)

On Wed, Dec 11, 2024 at 09:12:13PM -0800, Connor Kuehl wrote:
> > I'm trying to develop a Kubernetes CSI driver that, among other
> > things, will be creating and tearing down NBD connections to other
> > hosts in the cluster, and am looking for idempotency design ideas.
> 
> Hey Eric,
> 
> This sounds cool! Is this pushed to a public repo somewhere that
> people can follow along?

Not just follow - contributions are welcome too!

https://gitlab.com/kubesan/kubesan

To date, the project has been working on a demo on an OpenShift
cluster with KubeSAN as its CSI driver and backed by a shared lvm
Volume Group on top of a LUN from fibre channel SAN storage (it is
also possible to create a shared Volume Group with iSCSI storage that
will also benefit).  Using just lvm thin LVs managed by KubeSAN, I was
able to migrate a kubevirt virtual machine from one node to another
within the cluster, even though lvm can only activate thin LVs on one
node at a time - NBD was key to providing the illusion of RWX
(ReadWriteMany) access that kubevirt requires for the duration of the
migration.  With thin LVs, it will also be a straightforward step to
provide CSI Snapshots.  CSI cloning will be a bit more complex, and
may provide another opportunity for NBD exports to be in use.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

