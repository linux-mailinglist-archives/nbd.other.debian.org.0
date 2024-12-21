Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D989FA214
	for <lists+nbd@lfdr.de>; Sat, 21 Dec 2024 20:00:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68D0B206BF; Sat, 21 Dec 2024 19:00:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Dec 21 19:00:33 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8C6952069C
	for <lists-other-nbd@bendel.debian.org>; Sat, 21 Dec 2024 19:00:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id f71UyJO39dum for <lists-other-nbd@bendel.debian.org>;
	Sat, 21 Dec 2024 19:00:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id CA8D5206B6
	for <nbd@other.debian.org>; Sat, 21 Dec 2024 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734807612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOUAki/AGY+tfzO/IRuvuqrpd2e7AIcONH3Tqqrvp10=;
	b=driz+9HmuOZz6D9Max8Bpnfkyh9XCJhYtsrRKC0SaAPMhXc/DbuZagj5KURP9bsk+WxxmS
	7K0cBKyRcyP9zRyehemAME1A0niAIiYOcevq0SBW/TKhbh7DvnXXHHqsnYoQ82ayH4Y+YJ
	6wNa9GRARmMnc1p2R1KRoQr86dOKX0A=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-kejdBjpYNiePdbbreDdO4g-1; Sat,
 21 Dec 2024 14:00:06 -0500
X-MC-Unique: kejdBjpYNiePdbbreDdO4g-1
X-Mimecast-MFC-AGG-ID: kejdBjpYNiePdbbreDdO4g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0E081956086;
	Sat, 21 Dec 2024 19:00:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.27])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D016419560A2;
	Sat, 21 Dec 2024 19:00:02 +0000 (UTC)
Date: Sat, 21 Dec 2024 12:59:59 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, stefanha@redhat.com
Subject: Re: [PATCH 0/2] Add support for setting netlink backend string
Message-ID: <ynw7fbsiuwuzl7ghuixdmkbezq4huch7yhuhi457f2iwmlirmz@fp7bavolyuda>
References: <20241119233057.2248038-1-eblake@redhat.com>
 <eurcm2jfmaynf4ycx3qqpmiojrtaewzog3znjwnhderza7txrt@4u7mh2gt7cuh>
 <Z2VMn__hjblWkLx-@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <Z2VMn__hjblWkLx-@pc220518.home.grep.be>
User-Agent: NeoMutt/20241114
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tk7767BdsgvApCQS80iO3bzSnVoNQblDlHj_8HhDaP8_1734807605
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xMxHQ50jMm.A.fCUK.RBxZnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3203
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ynw7fbsiuwuzl7ghuixdmkbezq4huch7yhuhi457f2iwmlirmz@fp7bavolyuda
Resent-Date: Sat, 21 Dec 2024 19:00:33 +0000 (UTC)

On Fri, Dec 20, 2024 at 12:53:19PM +0200, Wouter Verhelst wrote:
> Hi Eric,
> 
> Sorry for the late reply; I was travelling a lot in the last two or so
> months and had little time to look at things in my time off.

No problem.  Hope you enjoyed your travels.

> 
> This looks good to me; please commit.

Committed as cf5a7743..87c5318a

> 
> On Thu, Dec 12, 2024 at 12:36:22PM -0600, Eric Blake wrote:
> > ping
> > 
> > This patch series is being added as a dependency to KubeSAN:
> > https://gitlab.com/kubesan/kubesan/-/merge_requests/100/diffs?commit_id=89a370dcde
> > https://quay.io/repository/kubesan/nbd-client-i
> > 
> > so it would be nice to have it upstream instead of in a one-off fork.
> > 
> > On Tue, Nov 19, 2024 at 05:27:27PM -0600, Eric Blake wrote:
> > > Stefan Hajnoczi pointed out to me that since kernel 5.14 (commit
> > > 6497ef8d in Apr 2021), the netlink interface has allowed userspace to
> > > pass in an arbitrary backend string visible at
> > > /sys/block/nbdN/backend, and which prevents the abuse of netlink to
> > > arbitrarily reconfigure an active NBD connection to a different
> > > backend, for some added safety when multiple threads might be racing
> > > to create NBD devices.  Time to expose it in nbd-client, along with
> > > first fixing some regressions along the way.

Interestingly, I note that while the netlink interface in the kernel
_requires_ that if the user passed in an identifer on create, then it
must pass in the same identifier on a reconfigure (ie. reconfigure
will fail if the user is not attempting to reconfigure the same
backend); but when it comes to deletion, the kernel does not check for
any consistency, even if the user passes in an indentifier.  I
understand that for backwards compatibility, the deletion MUST happen
if the user does not pass in an identifier, but it would be nice if
the kernel insisted that deletion is only possible with the same
identifier that was used in creation if the user did bother to pass in
an identifier at deletion.  So if I do get the kernel patched along
those lines, this patch will need a followup to add support for
'nbd-client -d /dev/nbd0 -i $backend_passed_to_the_create'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

