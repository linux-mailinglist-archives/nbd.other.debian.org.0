Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A299EFB1B
	for <lists+nbd@lfdr.de>; Thu, 12 Dec 2024 19:36:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 16853204C3; Thu, 12 Dec 2024 18:36:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 12 18:36:49 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 92517204B1
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Dec 2024 18:36:39 +0000 (UTC)
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
	with ESMTP id 9QghErJRN_wS for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Dec 2024 18:36:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id E5506204BE
	for <nbd@other.debian.org>; Thu, 12 Dec 2024 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734028588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SAJy2Va3eQa6jmzJlgn9F27Yt4U9fBioeHEvMczRM2I=;
	b=hkLqhmJXaH3G7vTruJzw8Bp8IbTkC/+Ch93o4fLswNAap/T4n4VWQkdw9SSp1mEg3NEsEQ
	RGtYkY76uTaSfOu/XBniISyjRbL48upuBDO14Wl0AGj3RymlEPw7kSIG0O0Wmt9Ttl6Byh
	UfLz+EzpGsjEfXFjbGusN1/+7jBM7lo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-qnWd5tY5M1mehtCYrff-Lg-1; Thu,
 12 Dec 2024 13:36:27 -0500
X-MC-Unique: qnWd5tY5M1mehtCYrff-Lg-1
X-Mimecast-MFC-AGG-ID: qnWd5tY5M1mehtCYrff-Lg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 794B219560AD
	for <nbd@other.debian.org>; Thu, 12 Dec 2024 18:36:26 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.81])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB5CF1955F41;
	Thu, 12 Dec 2024 18:36:24 +0000 (UTC)
Date: Thu, 12 Dec 2024 12:36:22 -0600
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: stefanha@redhat.com
Subject: Re: [PATCH 0/2] Add support for setting netlink backend string
Message-ID: <eurcm2jfmaynf4ycx3qqpmiojrtaewzog3znjwnhderza7txrt@4u7mh2gt7cuh>
References: <20241119233057.2248038-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20241119233057.2248038-1-eblake@redhat.com>
User-Agent: NeoMutt/20241114
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H-5rXTMLuetwS4SDkpMqTzZYijX9P0SlZoueimtPGXM_1734028586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CatHXVHwxhJ.A.EkdB.A1yWnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3198
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/eurcm2jfmaynf4ycx3qqpmiojrtaewzog3znjwnhderza7txrt@4u7mh2gt7cuh
Resent-Date: Thu, 12 Dec 2024 18:36:49 +0000 (UTC)

ping

This patch series is being added as a dependency to KubeSAN:
https://gitlab.com/kubesan/kubesan/-/merge_requests/100/diffs?commit_id=89a370dcde
https://quay.io/repository/kubesan/nbd-client-i

so it would be nice to have it upstream instead of in a one-off fork.

On Tue, Nov 19, 2024 at 05:27:27PM -0600, Eric Blake wrote:
> Stefan Hajnoczi pointed out to me that since kernel 5.14 (commit
> 6497ef8d in Apr 2021), the netlink interface has allowed userspace to
> pass in an arbitrary backend string visible at
> /sys/block/nbdN/backend, and which prevents the abuse of netlink to
> arbitrarily reconfigure an active NBD connection to a different
> backend, for some added safety when multiple threads might be racing
> to create NBD devices.  Time to expose it in nbd-client, along with
> first fixing some regressions along the way.
> 
> Eric Blake (2):
>   nbd-client: Fix use without -N
>   nbd-client: Add support for setting /sys/block/nbdN/backend
> 
>  .gitignore               |  1 +
>  man/nbd-client.8.sgml.in | 24 +++++++++++++++++++++++-
>  nbd-client.c             | 30 ++++++++++++++++++++++++------
>  nbd-netlink.h            |  7 +++++--
>  4 files changed, 53 insertions(+), 9 deletions(-)
> 
> -- 
> 2.47.0
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

