Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 047DA40D4B0
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 10:39:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 99CB7208B6; Thu, 16 Sep 2021 08:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 08:39:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 555DD208A4
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 08:23:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Gk-4mN4YHbAj for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 08:23:00 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id B635320644
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631780575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWt3ip4CBk0I1AL9OVGf26EzSToILsSmwhya6rje3aI=;
	b=U0kuVAxBD6giqI0kxDnorPZzFfvQVOSQBn2sXlu/PuuLW0qEZjSgfiobdZxpcbg6iypd09
	iEhqxJ0U9/Y0ucWJBskHpFjKnbgKLFR7NIax0yi4QRwSBdj7FODMobu7CKdPUck9cg8Djx
	FEAmqOa/T4IslsLxjlwkGip161RgBzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-j50vqmdTPD6_xx3ZVhctiA-1; Thu, 16 Sep 2021 04:22:54 -0400
X-MC-Unique: j50vqmdTPD6_xx3ZVhctiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B40950759;
	Thu, 16 Sep 2021 08:22:53 +0000 (UTC)
Received: from T590 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42E22838DB;
	Thu, 16 Sep 2021 08:22:32 +0000 (UTC)
Date: Thu, 16 Sep 2021 16:22:44 +0800
From: Ming Lei <ming.lei@redhat.com>
To: pkalever@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, josef@toxicpanda.com, axboe@kernel.dk,
	idryomov@redhat.com, xiubli@redhat.com,
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Subject: Re: [PATCH v1 1/2] block: cleanup: define default command timeout
 and use it
Message-ID: <YUL+1PE1z5aM0eTM@T590>
References: <20210806142914.70556-1-pkalever@redhat.com>
 <20210806142914.70556-2-pkalever@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806142914.70556-2-pkalever@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BkisssLn2MD.A.kiC.tKwQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1490
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUL+1PE1z5aM0eTM@T590
Resent-Date: Thu, 16 Sep 2021 08:39:09 +0000 (UTC)

On Fri, Aug 06, 2021 at 07:59:13PM +0530, pkalever@redhat.com wrote:
> From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> 
> defined BLK_DEFAULT_CMD_TIMEOUT and reuse it everywhere else.
> 
> Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> ---

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

