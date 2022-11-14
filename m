Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C0100628C6E
	for <lists+nbd@lfdr.de>; Mon, 14 Nov 2022 23:57:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A41DF20678; Mon, 14 Nov 2022 22:57:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 22:57:39 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F034B20615
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:57:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GFnoTkDeQrbO for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:57:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id EF07720612
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=d3fET0rtnvSWynsr5mjLXLuuulKrFHFYfgB7IIbxIYA=;
	b=SpIvOu1tiyi5bM1qirlZnBmCBc5ocIrl4iAZBM9hfKOgrmhgtHzoC+H4QEEy41cPMt35U+
	K5gI146cjLInAOr1VSg1OayJgNhP8iVCKbfwP6mvzXU9vo2OtrD2uX7m3j83XaT9SEX0Ar
	TK1k5P3PcZvrzEvtPfcuJrCuT8McdLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-T6kK6GdeN2-Wk30QTJDsRw-1; Mon, 14 Nov 2022 17:41:46 -0500
X-MC-Unique: T6kK6GdeN2-Wk30QTJDsRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D73F085A59D;
	Mon, 14 Nov 2022 22:41:45 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60BA41415102;
	Mon, 14 Nov 2022 22:41:45 +0000 (UTC)
Date: Mon, 14 Nov 2022 16:41:41 -0600
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, libguestfs@redhat.com,
	nbd@other.debian.org
Subject: [cross-project PATCH v2] NBD 64-bit extensions
Message-ID: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RJeE5ZiWJxE.A.52.jfscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2250
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224141.cm5jgyxfmvie5xb5@redhat.com
Resent-Date: Mon, 14 Nov 2022 22:57:39 +0000 (UTC)

This is a cover letter for a set of multi-project patch series all
designed to implement 64-bit operations in NBD, and demonstrate
interoperability of the new extension between projects.

v1 of the project was attempted nearly a year ago:
https://lists.nongnu.org/archive/html/qemu-devel/2021-12/msg00453.html

Since then, I've addressed a lot of preliminary cleanups in libnbd to
make it easier to test things, and incorporated review comments issued
on v1, including:

- no orthogonality between simple/structured replies and 64-bit mode:
  once extended headers are negotiated, all transmission traffic (both
  from client to server and server to client) uses just one header
  size

- add support for the client to pass a payload on commands to the
  server, and demonstrate it by further implementing a way to pass a
  flag with NBD_CMD_BLOCK_STATUS that says the client is passing a
  payload to request status of just a subset of the negotiated
  contexts, rather than all possible contexts that were earlier
  negotiated during NBD_OPT_SET_META_CONTEXT

- tweaks to the header layouts: tweak block status to provide 64-bit
  flags values (although "base:allocation" will remain usable with
  just 32-bit flags); reply with offset rather than padding and with
  fields rearranged for maximal sharing between client and server
  layouts

- word-smithing of the NBD proposed protocol; split things into
  several smaller patches, where we can choose how much to take

- more unit tests added in qemu and libnbd

- the series end with RFC patches on whether to support 64-bit hole
  responses to NBD_CMD_READ, even though our current limitations say
  servers don't have to accept more than a 32M read request and
  therefore will never have that big of a hole to read)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

