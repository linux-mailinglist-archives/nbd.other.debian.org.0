Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0C41488D
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 14:14:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3FD9E20B70; Wed, 22 Sep 2021 12:14:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 12:14:19 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4594020B6E
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 12:14:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Bzl8PqZOcn7c for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 12:14:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 550E720B6B
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632312843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+xSsbPHQKOwQ9OmkdFU3DkicOwCTWlOdhjf2gURoAqY=;
	b=Bu77QR3vPbgknYyFXVvzux510MTyLCnXFOEwnCfakr/Y8xZ9Dtr/FMv3YPp5c0ClRb3Y3j
	7dIlo7Ei8Ayt1YKQPsl+kdpVj263L5ONhFjtvBOE0OCa7U6N4Ug+FZHtnlrgMOWXT8joHj
	kfK4IQVOZ00oYXg2nCz+m893rrkDnd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-wM_WK9WsNt-yQlVxCkaXgg-1; Wed, 22 Sep 2021 08:12:06 -0400
X-MC-Unique: wM_WK9WsNt-yQlVxCkaXgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EE5E101F000;
	Wed, 22 Sep 2021 12:12:04 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A18E12D4A;
	Wed, 22 Sep 2021 12:12:03 +0000 (UTC)
Date: Wed, 22 Sep 2021 07:12:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: "yukuai (C)" <yukuai3@huawei.com>, josef@toxicpanda.com,
	axboe@kernel.dk, hch@infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [patch v8 3/7] nbd: check sock index in nbd_read_stat()
Message-ID: <20210922121201.neskyaenjh64wmyb@redhat.com>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
 <20210916093350.1410403-4-yukuai3@huawei.com>
 <7e2913ca-1089-9ab7-cfdb-5e8837d36034@huawei.com>
 <YUr1v8zylPOFFXTO@T590>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUr1v8zylPOFFXTO@T590>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nvs1jzakVxJ.A.3U.b4xShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1517
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210922121201.neskyaenjh64wmyb@redhat.com
Resent-Date: Wed, 22 Sep 2021 12:14:19 +0000 (UTC)

On Wed, Sep 22, 2021 at 05:22:07PM +0800, Ming Lei wrote:
> 
> I think this one relies on nbd protocol between server and client, and
> does the protocol require both request and reply xmitted via same
> socket?

Yes, a reply must be transmitted on the same socket as the request
came over.  This is because independent sockets are not required to
use distinct 64-bit handles, and there is no way for a server to tell
if independent clients are related to one another; sending a reply on
the wrong socket is thus not guaranteed to reach the intended client.
Thus, a compliant server will never send a reply over a different
socket than the original request, and if a client ever gets a reply
with a handle it was not expecting, then the server is buggy or
malicious.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

