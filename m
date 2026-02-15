Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H5pBJ4sakmlDrAEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sun, 15 Feb 2026 20:12:11 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63713F7DF
	for <lists+nbd@lfdr.de>; Sun, 15 Feb 2026 20:12:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D3A66205D3; Sun, 15 Feb 2026 19:12:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Feb 15 19:12:10 2026
Old-Return-Path: <hristo@venev.name>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C650F20629
	for <lists-other-nbd@bendel.debian.org>; Sun, 15 Feb 2026 18:55:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.098 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4t0HRpALJyho for <lists-other-nbd@bendel.debian.org>;
	Sun, 15 Feb 2026 18:55:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 2954 seconds by postgrey-1.36 at bendel; Sun, 15 Feb 2026 18:55:08 UTC
Received: from a1-bg02.venev.name (a1-bg02.venev.name [213.240.239.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B9A6420642
	for <nbd@other.debian.org>; Sun, 15 Feb 2026 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=venev.name;
	s=default; h=Content-Transfer-Encoding:Message-ID:Date:Subject:To:From:
	Content-Type:Reply-To:Sender; bh=HT0C8IQtP6ll2eG6quVPn4D1EGUnvCU9+Ng85cw2CDo=
	; b=lKdzryJKkZ+EVYmAIQxQdwhNCKVztbSAPr1hm5d/pq+uCirMrZxueRIaHaDpQW8vZDOt56x+0
	iO2VBKZKduawDOSIV0NXcdL8p7KumYEHotDfvhmZZxOBclKu0VNckWM/1GRZYvlgWVwCmUPRhUaWS
	euW/2O61gS72JGuXWmlyizlMWd9l9arXEgPh4KBx5GFspOIRemywHoKSjx4IBo0J2WRANpENKN7EV
	JbNLJy1dfntVd3X/ronNf7ZhOHYwIcwidKpNB8C/ZsfPSE+BPbJ4cgXGtVwPGFoMqItcehCEkoqcc
	jgnoTCHDENFO6ElQixvc//woqgS7GgaGSgtA3FoVYWZSSiQULKkL5Yx00CUcCWqUDzYw5xJbTwT1Z
	KNEAI6xuVugEZkivqxfrl6h45nEW47yQjbccsCTVn8gH37mxkQYL6IUTieysj5omIHHkG32qwdprL
	8D937XiGh1n7wQRJKl3LBTLUnAof5k+R7jCILkvxyQwwuG7X7xzmrN7rBFb/N4TQv4VKzk57AEdDi
	DTVYBy4gijQjqnrnWckHcEz7JhYH5ufzyBKnPtiSSBA3/oQWJyuVK3tThALl8U4/3FsSA9s8VyBJ+
	SwLDXmktOL4qlqJfGFt6ots35moKi5DFnBGSq8fQuhOOqiXgNy3q0K7yiUtCrapbgzNb5H4=;
Received: from a1-bg02.venev.name ([213.240.239.49] helo=pmx1.venev.name)
	by a1-bg02.venev.name with esmtps
	id 1vrgV3-00000009U7A-3lW3
	(TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(envelope-from <hristo@venev.name>);
	Sun, 15 Feb 2026 18:05:41 +0000
Received: from venev.name ([213.240.239.49])
	by pmx1.venev.name with ESMTPSA
	id wgezEPUKkmnpfiIAdB6GMg
	(envelope-from <hristo@venev.name>); Sun, 15 Feb 2026 18:05:41 +0000
From: Hristo Venev <hristo@venev.name>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hristo Venev <hristo@venev.name>
Subject: [PATCH] netlink: specs: add specification for NBD
Date: Sun, 15 Feb 2026 20:03:02 +0200
Message-ID: <20260215180309.2255721-3-hristo@venev.name>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_K_WjDnY39G.A.31TJ.KqhkpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3490
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260215180309.2255721-3-hristo@venev.name
Resent-Date: Sun, 15 Feb 2026 19:12:10 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[venev.name,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[venev.name:s=default];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:netdev@vger.kernel.org,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:hristo@venev.name,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hristo@venev.name,bounce-nbd=lists@other.debian.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[venev.name:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[venev.name:mid,venev.name:dkim,venev.name:email,bendel.debian.org:helo,bendel.debian.org:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hristo@venev.name,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[213.240.239.49:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Queue-Id: 3D63713F7DF
X-Rspamd-Action: no action

This patch adds an initial YNL specification for NBD. The specification
can be used to produce a UAPI header that is equivalent to the one
currently shipped in the kernel.

The spec appears to be accurate enough so that commands can be issued
with pyynl.

Signed-off-by: Hristo Venev <hristo@venev.name>
---
 Documentation/netlink/specs/nbd.yaml | 206 +++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 Documentation/netlink/specs/nbd.yaml

diff --git a/Documentation/netlink/specs/nbd.yaml b/Documentation/netlink/specs/nbd.yaml
new file mode 100644
index 0000000000000..a84912a867d91
--- /dev/null
+++ b/Documentation/netlink/specs/nbd.yaml
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+---
+name: nbd
+protocol: genetlink-c
+uapi-header: linux/nbd-netlink.h
+doc: See :file:`drivers/block/nbd.c`
+
+c-family-name: nbd-genl-family-name
+c-version-name: nbd-genl-version
+max-by-define: true
+
+attribute-sets:
+  -
+    name: nbd-attrs
+    name-prefix: nbd-attr-
+    doc: Configuration policy attributes, used for CONNECT
+    attributes:
+      -
+        name: unspec
+        value: 0
+        type: unused
+      -
+        name: index
+        type: u32
+      -
+        name: size-bytes
+        type: u64
+      -
+        name: block-size-bytes
+        type: u64
+      -
+        name: timeout
+        type: u64
+      -
+        name: server-flags
+        type: u64
+      -
+        name: client-flags
+        type: u64
+      -
+        name: sockets
+        type: nest
+        nested-attributes: sock-item-attrs
+      -
+        name: dead-conn-timeout
+        type: u64
+      -
+        name: device-list
+        type: nest
+        nested-attributes: device-item-attrs
+      -
+        name: backend-identifier
+        type: string
+  -
+    name: device-item-attrs
+    name-prefix: nbd-device-item-
+    doc: |
+      This is the format for multiple devices with :code:`NBD_ATTR_DEVICE_LIST`
+
+      .. code-block::
+
+        [NBD_ATTR_DEVICE_LIST]
+          [NBD_DEVICE_ITEM]
+            [NBD_DEVICE_INDEX]
+            [NBD_DEVICE_CONNECTED]
+    attributes:
+      -
+        name: unspec
+        value: 0
+        type: unused
+      -
+        name: item
+        name-prefix: nbd-device-
+        type: nest
+        nested-attributes: device-attrs
+        multi-attr: true
+  -
+    name: device-attrs
+    name-prefix: nbd-device-
+    attr-max-name: nbd-device-attr-max
+    attributes:
+      -
+        name: unspec
+        value: 0
+        type: unused
+      -
+        name: index
+        type: u32
+      -
+        name: connected
+        type: u8
+  -
+    name: sock-item-attrs
+    name-prefix: nbd-sock-item-
+    doc: |
+      This is the format for multiple sockets with :code:`NBD_ATTR_SOCKETS`
+
+      .. code-block::
+
+        [NBD_ATTR_SOCKETS]
+          [NBD_SOCK_ITEM]
+            [NBD_SOCK_FD]
+          [NBD_SOCK_ITEM]
+            [NBD_SOCK_FD]
+    attributes:
+      -
+        name: unspec
+        value: 0
+        type: unused
+      -
+        name: item
+        name-prefix: nbd-sock-
+        type: nest
+        nested-attributes: sock-attrs
+        multi-attr: true
+  -
+    name: sock-attrs
+    name-prefix: nbd-sock-
+    attributes:
+      -
+        name: unspec
+        value: 0
+        type: unused
+      -
+        name: fd
+        type: u32
+
+operations:
+  enum-model: unified
+  name-prefix: nbd-cmd-
+  list:
+    -
+      name: unspec
+      value: 0
+      doc: NBD_CMD_UNSPEC
+    -
+      name: connect
+      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_connect()`
+      attribute-set: nbd-attrs
+      dont-validate: [strict]
+      do:
+        request:
+          attributes:
+            - index
+            - size-bytes
+            - block-size-bytes
+            - timeout
+            - server-flags
+            - client-flags
+            - sockets
+            - dead-conn-timeout
+            - backend-identifier
+        reply:
+          attributes:
+            - index
+    -
+      name: disconnect
+      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_disconnect()`
+      attribute-set: nbd-attrs
+      dont-validate: [strict]
+      do:
+        request:
+          attributes:
+            - index
+    -
+      name: reconfigure
+      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_reconfigure()`
+      attribute-set: nbd-attrs
+      dont-validate: [strict]
+      do:
+        request:
+          attributes:
+            - index
+            - size-bytes
+            - block-size-bytes
+            - timeout
+            - client-flags
+            - sockets
+            - dead-conn-timeout
+            - backend-identifier
+    -
+      name: link-dead
+      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_mark_nsock_dead()` / :code:`nbd_dead_link_work()`
+      attribute-set: nbd-attrs
+      event:
+        attributes:
+          - index
+      mcgrp: nbd_mc_group
+    -
+      name: status
+      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_status()`
+      attribute-set: nbd-attrs
+      dont-validate: [strict]
+      do:
+        request:
+          attributes:
+            - index
+        reply:
+          attributes:
+            - device-list
+
+mcast-groups:
+  list:
+    -
+      name: nbd_mc_group
+      c-define-name: nbd-genl-mcast-group-name
-- 
2.53.0

